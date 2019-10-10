Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3161DD2887
	for <lists+linux-next@lfdr.de>; Thu, 10 Oct 2019 13:59:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726869AbfJJL7A (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 10 Oct 2019 07:59:00 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:53616 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1733057AbfJJL7A (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Thu, 10 Oct 2019 07:59:00 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x9ABQZKX157656
        for <linux-next@vger.kernel.org>; Thu, 10 Oct 2019 07:58:59 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2vj0kdynq7-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-next@vger.kernel.org>; Thu, 10 Oct 2019 07:58:58 -0400
Received: from localhost
        by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-next@vger.kernel.org> from <psampat@linux.ibm.com>;
        Thu, 10 Oct 2019 12:58:57 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
        by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Thu, 10 Oct 2019 12:58:55 +0100
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
        by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id x9ABwrpc41156610
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 10 Oct 2019 11:58:54 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id C6B474204C;
        Thu, 10 Oct 2019 11:58:53 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id DD4A442049;
        Thu, 10 Oct 2019 11:58:51 +0000 (GMT)
Received: from pratiks-thinkpad.ibmuc.com (unknown [9.199.37.96])
        by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Thu, 10 Oct 2019 11:58:51 +0000 (GMT)
From:   Pratik Rajesh Sampat <psampat@linux.ibm.com>
To:     linuxppc-dev@ozlabs.org, linux-next@vger.kernel.org,
        mpe@ellerman.id.au, svaidy@linux.ibm.com, ego@linux.vnet.ibm.com,
        premjha2@in.ibm.com, akshay.adiga@linux.vnet.ibm.com
Subject: [PATCH v1 3/3] powerpc/powernv: Parse device tree, population of SPR support
Date:   Thu, 10 Oct 2019 17:28:43 +0530
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191010115843.22283-1-psampat@linux.ibm.com>
References: <20191010115843.22283-1-psampat@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19101011-4275-0000-0000-00000370DB11
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19101011-4276-0000-0000-00003883E27B
Message-Id: <20191010115843.22283-4-psampat@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-10-10_04:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910100084
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Parse the device tree for nodes self-save, self-restore and populate
support for the preferred SPRs based what was advertised by the device
tree.

Signed-off-by: Pratik Rajesh Sampat <psampat@linux.ibm.com>
---
 arch/powerpc/platforms/powernv/idle.c | 104 ++++++++++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/arch/powerpc/platforms/powernv/idle.c b/arch/powerpc/platforms/powernv/idle.c
index f0dd377820c7..43ad0e543b84 100644
--- a/arch/powerpc/platforms/powernv/idle.c
+++ b/arch/powerpc/platforms/powernv/idle.c
@@ -1408,6 +1408,107 @@ static void __init pnv_probe_idle_states(void)
 		supported_cpuidle_states |= pnv_idle_states[i].flags;
 }
 
+/*
+ * Extracts and populates the self save or restore capabilities
+ * passed from the device tree node
+ */
+static int extract_save_restore_state_dt(struct device_node *np, int type)
+{
+	int nr_sprns = 0, i, bitmask_index;
+	int rc = 0;
+	u32 active = 0;
+	u64 *temp_u64;
+	u64 bit_pos;
+
+	if (of_property_read_u32(np, "active", &active)) {
+		pr_warn("opal: failed to find the active value for self save/restore node");
+		return -EINVAL;
+	}
+
+	if (!active) {
+		/*
+		 * if the feature is not active, strip the preferred_sprs from
+		 * that capability.
+		 */
+		if (type == SELF_RESTORE_TYPE) {
+			for (i = 0; i < nr_preferred_sprs; i++) {
+				preferred_sprs[i].supported_mode &=
+					~SELF_RESTORE_STRICT;
+			}
+		} else {
+			for (i = 0; i < nr_preferred_sprs; i++) {
+				preferred_sprs[i].supported_mode &=
+					~SELF_SAVE_STRICT;
+			}
+		}
+		return 0;
+	}
+	nr_sprns = of_property_count_u64_elems(np, "sprn-bitmask");
+	if (nr_sprns <= 0)
+		return rc;
+	temp_u64 = kcalloc(nr_sprns, sizeof(u64), GFP_KERNEL);
+	if (of_property_read_u64_array(np, "sprn-bitmask",
+				       temp_u64, nr_sprns)) {
+		pr_warn("cpuidle-powernv: failed to find registers in DT\n");
+		kfree(temp_u64);
+		return -EINVAL;
+	}
+	/*
+	 * Populate acknowledgment of support for the sprs in the global vector
+	 * gotten by the registers supplied by the firmware.
+	 * The registers are in a bitmask, bit index within
+	 * that specifies the SPR
+	 */
+	for (i = 0; i < nr_preferred_sprs; i++) {
+		bitmask_index = preferred_sprs[i].spr / 64;
+		bit_pos = preferred_sprs[i].spr % 64;
+		if ((temp_u64[bitmask_index] & (1UL << bit_pos)) == 0) {
+			if (type == SELF_RESTORE_TYPE)
+				preferred_sprs[i].supported_mode &=
+					~SELF_RESTORE_STRICT;
+			else
+				preferred_sprs[i].supported_mode &=
+					~SELF_SAVE_STRICT;
+			continue;
+		}
+		if (type == SELF_RESTORE_TYPE) {
+			preferred_sprs[i].supported_mode |=
+				SELF_RESTORE_STRICT;
+		} else {
+			preferred_sprs[i].supported_mode |=
+				SELF_SAVE_STRICT;
+		}
+	}
+
+	kfree(temp_u64);
+	return rc;
+}
+
+static int pnv_parse_deepstate_dt(void)
+{
+	struct device_node *np, *np1;
+	int rc = 0;
+
+	/* Self restore register population */
+	np = of_find_node_by_path("/ibm,opal/power-mgt/self-restore");
+	if (!np) {
+		pr_warn("opal: self restore Node not found");
+	} else {
+		rc = extract_save_restore_state_dt(np, SELF_RESTORE_TYPE);
+		if (rc != 0)
+			return rc;
+	}
+	/* Self save register population */
+	np1 = of_find_node_by_path("/ibm,opal/power-mgt/self-save");
+	if (!np1) {
+		pr_warn("opal: self save Node not found");
+		pr_warn("Legacy firmware. Assuming default self-restore support");
+	} else {
+		rc = extract_save_restore_state_dt(np1, SELF_SAVE_TYPE);
+	}
+	return rc;
+}
+
 /*
  * This function parses device-tree and populates all the information
  * into pnv_idle_states structure. It also sets up nr_pnv_idle_states
@@ -1556,6 +1657,9 @@ static int __init pnv_init_idle_states(void)
 		return rc;
 	pnv_probe_idle_states();
 
+	rc = pnv_parse_deepstate_dt();
+	if (rc)
+		return rc;
 	if (!cpu_has_feature(CPU_FTR_ARCH_300)) {
 		if (!(supported_cpuidle_states & OPAL_PM_SLEEP_ENABLED_ER1)) {
 			power7_fastsleep_workaround_entry = false;
-- 
2.21.0

