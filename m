Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4933F2DB056
	for <lists+linux-next@lfdr.de>; Tue, 15 Dec 2020 16:45:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730301AbgLOPnl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 15 Dec 2020 10:43:41 -0500
Received: from foss.arm.com ([217.140.110.172]:47670 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730315AbgLOPne (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 15 Dec 2020 10:43:34 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 523271FB;
        Tue, 15 Dec 2020 07:42:48 -0800 (PST)
Received: from e123648.arm.com (unknown [10.57.22.20])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9DA613F66B;
        Tue, 15 Dec 2020 07:42:46 -0800 (PST)
From:   Lukasz Luba <lukasz.luba@arm.com>
To:     linux-kernel@vger.kernel.org, daniel.lezcano@linaro.org,
        sfr@canb.auug.org.au
Cc:     linux-next@vger.kernel.org, rui.zhang@intel.com,
        lukasz.luba@arm.com
Subject: [PATCH] thermal: devfreq_cooling: fix the build when !ENERGY_MODEL
Date:   Tue, 15 Dec 2020 15:42:21 +0000
Message-Id: <20201215154221.8828-1-lukasz.luba@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201215125806.31495950@canb.auug.org.au>
References: <20201215125806.31495950@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Prevent build failure if the option CONFIG_ENERGY_MODEL is not set. The
devfreq cooling is able to operate without the Energy Model.
Don't use dev->em_pd directly and use local pointer.

Fixes: 615510fe13bd2 ("thermal: devfreq_cooling: remove old power model and use EM")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>
---
Hi Daniel,

The devfreq cooling implementation can work without the EM and it has been
design to handle it. There is only one bit that needs to be changed and
used as in v2 (where there was this 'em' private field).
Implementation is similar to the cpufreq cooling.
We don't need to put the ENERGY_MODEL dependency in Kconfig.

Regards,
Lukasz


 drivers/thermal/devfreq_cooling.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/thermal/devfreq_cooling.c b/drivers/thermal/devfreq_cooling.c
index df1049a34777..fed3121ff2a1 100644
--- a/drivers/thermal/devfreq_cooling.c
+++ b/drivers/thermal/devfreq_cooling.c
@@ -48,6 +48,7 @@ static DEFINE_IDA(devfreq_ida);
  * @capped_state:	index to cooling state with in dynamic power budget
  * @req_max_freq:	PM QoS request for limiting the maximum frequency
  *			of the devfreq device.
+ * @em_pd:		Energy Model for the associated Devfreq device
  */
 struct devfreq_cooling_device {
 	int id;
@@ -60,6 +61,7 @@ struct devfreq_cooling_device {
 	u32 res_util;
 	int capped_state;
 	struct dev_pm_qos_request req_max_freq;
+	struct em_perf_domain *em_pd;
 };
 
 static int devfreq_cooling_get_max_state(struct thermal_cooling_device *cdev,
@@ -99,9 +101,9 @@ static int devfreq_cooling_set_cur_state(struct thermal_cooling_device *cdev,
 	if (state > dfc->max_state)
 		return -EINVAL;
 
-	if (dev->em_pd) {
+	if (dfc->em_pd) {
 		perf_idx = dfc->max_state - state;
-		freq = dev->em_pd->table[perf_idx].frequency * 1000;
+		freq = dfc->em_pd->table[perf_idx].frequency * 1000;
 	} else {
 		freq = dfc->freq_table[state];
 	}
@@ -181,7 +183,6 @@ static int devfreq_cooling_get_requested_power(struct thermal_cooling_device *cd
 {
 	struct devfreq_cooling_device *dfc = cdev->devdata;
 	struct devfreq *df = dfc->devfreq;
-	struct device *dev = df->dev.parent;
 	struct devfreq_dev_status status;
 	unsigned long state;
 	unsigned long freq;
@@ -204,7 +205,7 @@ static int devfreq_cooling_get_requested_power(struct thermal_cooling_device *cd
 		res = dfc->power_ops->get_real_power(df, power, freq, voltage);
 		if (!res) {
 			state = dfc->capped_state;
-			dfc->res_util = dev->em_pd->table[state].power;
+			dfc->res_util = dfc->em_pd->table[state].power;
 			dfc->res_util *= SCALE_ERROR_MITIGATION;
 
 			if (*power > 1)
@@ -214,7 +215,7 @@ static int devfreq_cooling_get_requested_power(struct thermal_cooling_device *cd
 		}
 	} else {
 		/* Energy Model frequencies are in kHz */
-		perf_idx = get_perf_idx(dev->em_pd, freq / 1000);
+		perf_idx = get_perf_idx(dfc->em_pd, freq / 1000);
 		if (perf_idx < 0) {
 			res = -EAGAIN;
 			goto fail;
@@ -223,7 +224,7 @@ static int devfreq_cooling_get_requested_power(struct thermal_cooling_device *cd
 		_normalize_load(&status);
 
 		/* Scale power for utilization */
-		*power = dev->em_pd->table[perf_idx].power;
+		*power = dfc->em_pd->table[perf_idx].power;
 		*power *= status.busy_time;
 		*power >>= 10;
 	}
@@ -241,15 +242,13 @@ static int devfreq_cooling_state2power(struct thermal_cooling_device *cdev,
 				       unsigned long state, u32 *power)
 {
 	struct devfreq_cooling_device *dfc = cdev->devdata;
-	struct devfreq *df = dfc->devfreq;
-	struct device *dev = df->dev.parent;
 	int perf_idx;
 
 	if (state > dfc->max_state)
 		return -EINVAL;
 
 	perf_idx = dfc->max_state - state;
-	*power = dev->em_pd->table[perf_idx].power;
+	*power = dfc->em_pd->table[perf_idx].power;
 
 	return 0;
 }
@@ -259,7 +258,6 @@ static int devfreq_cooling_power2state(struct thermal_cooling_device *cdev,
 {
 	struct devfreq_cooling_device *dfc = cdev->devdata;
 	struct devfreq *df = dfc->devfreq;
-	struct device *dev = df->dev.parent;
 	struct devfreq_dev_status status;
 	unsigned long freq;
 	s32 est_power;
@@ -287,7 +285,7 @@ static int devfreq_cooling_power2state(struct thermal_cooling_device *cdev,
 	 * budget. The EM power table is sorted ascending.
 	 */
 	for (i = dfc->max_state; i > 0; i--)
-		if (est_power >= dev->em_pd->table[i].power)
+		if (est_power >= dfc->em_pd->table[i].power)
 			break;
 
 	*state = dfc->max_state - i;
@@ -374,7 +372,8 @@ of_devfreq_cooling_register_power(struct device_node *np, struct devfreq *df,
 
 	dfc->devfreq = df;
 
-	if (dev->em_pd) {
+	dfc->em_pd = em_pd_get(dev);
+	if (dfc->em_pd) {
 		devfreq_cooling_ops.get_requested_power =
 			devfreq_cooling_get_requested_power;
 		devfreq_cooling_ops.state2power = devfreq_cooling_state2power;
@@ -382,7 +381,7 @@ of_devfreq_cooling_register_power(struct device_node *np, struct devfreq *df,
 
 		dfc->power_ops = dfc_power;
 
-		num_opps = em_pd_nr_perf_states(dev->em_pd);
+		num_opps = em_pd_nr_perf_states(dfc->em_pd);
 	} else {
 		/* Backward compatibility for drivers which do not use IPA */
 		dev_dbg(dev, "missing EM for cooling device\n");
-- 
2.17.1

