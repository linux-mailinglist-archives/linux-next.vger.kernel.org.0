Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9A423DB1AA
	for <lists+linux-next@lfdr.de>; Fri, 30 Jul 2021 05:03:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229971AbhG3DD4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 29 Jul 2021 23:03:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229750AbhG3DDz (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 29 Jul 2021 23:03:55 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB102C061765;
        Thu, 29 Jul 2021 20:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-ID:Content-Description:In-Reply-To:References;
        bh=UoUNO6SpxNZD8Kp5rDs7cJKyFvYdXqxIuqfJvEub1Mw=; b=ucmvasQyzJtn31aB4P2X78i/2y
        WGRcNUGJMLzlw2x+7VuL1yP5J+LpB1ljOzytIidamb08eRhyfn+niwxax2AqAUcd4dKXm6p1/VeRZ
        4MmxD9NN8f1wCwmYjvaq+XMPwWJYS5wk7Ha1LIia9iJjncXjq0VqYnz1PpILaJHVZKrfr0ckfA5GT
        +ccKpF25wV1W6pn+aKw/1PZjJV8YuVzDBPkmMQ31TFY3hWJ0RP3GbKCtpqsaGrssPFUp2dMX5Kk7y
        U/0J0FFaYn8slPT3+tOa+NXhXdmHD7RFanIAVP7UWcT9TBPZZGCwoTgmyTl7JrCHq7aAQf6Cn42ro
        oHvha7RA==;
Received: from [2601:1c0:6280:3f0::aefb] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1m9IoO-006n2H-Cd; Fri, 30 Jul 2021 03:03:48 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        "Pan, Xinhui" <Xinhui.Pan@amd.com>, amd-gfx@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-next@vger.kernel.org
Subject: [PATCH -next] drm/amdgpu: fix checking pmops when PM_SLEEP is not enabled
Date:   Thu, 29 Jul 2021 20:03:47 -0700
Message-Id: <20210730030347.13996-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

'pm_suspend_target_state' is only available when CONFIG_PM_SLEEP
is set/enabled. OTOH, when both SUSPEND and HIBERNATION are not set,
PM_SLEEP is not set, so this variable cannot be used.

../drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c: In function ‘amdgpu_acpi_is_s0ix_active’:
../drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c:1046:11: error: ‘pm_suspend_target_state’ undeclared (first use in this function); did you mean ‘__KSYM_pm_suspend_target_state’?
    return pm_suspend_target_state == PM_SUSPEND_TO_IDLE;
           ^~~~~~~~~~~~~~~~~~~~~~~
           __KSYM_pm_suspend_target_state

Also use shorter IS_ENABLED(CONFIG_foo) notation for checking the
2 config symbols.

Fixes: 91b03fc6b50c ("drm/amdgpu: Check pmops for desired suspend state")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-next@vger.kernel.org
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linext-20210729.orig/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
+++ linext-20210729/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
@@ -1040,7 +1040,7 @@ void amdgpu_acpi_detect(void)
  */
 bool amdgpu_acpi_is_s0ix_active(struct amdgpu_device *adev)
 {
-#if defined(CONFIG_AMD_PMC) || defined(CONFIG_AMD_PMC_MODULE)
+#if IS_ENABLED(CONFIG_AMD_PMC) && IS_ENABLED(CONFIG_PM_SLEEP)
 	if (acpi_gbl_FADT.flags & ACPI_FADT_LOW_POWER_S0) {
 		if (adev->flags & AMD_IS_APU)
 			return pm_suspend_target_state == PM_SUSPEND_TO_IDLE;
