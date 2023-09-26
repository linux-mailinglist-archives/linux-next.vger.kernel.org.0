Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B3FA7AEACD
	for <lists+linux-next@lfdr.de>; Tue, 26 Sep 2023 12:52:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234461AbjIZKw5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 Sep 2023 06:52:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234460AbjIZKw4 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 26 Sep 2023 06:52:56 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 418B495
        for <linux-next@vger.kernel.org>; Tue, 26 Sep 2023 03:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1695725522;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=X4uB88kvmb2OybCMfZJsL98qGlQf9b7gdl07NjAzN9g=;
        b=JWZyz3tcs7LkUpAvGqLbqcX9NpEYju7XdjJDlRlRigC4eJSvLnEjUJovhDpo+6NCt1NeqB
        Sd0eV6HCYscF6ME3yfQMX1MoklLz/D7CQw1n4XO+TudwfQAoZS38IlPO639eL+/oCOWqbQ
        HDlLsK3ee2HCidOOkwLWv2pKL+fBXKk=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-625-m1IEU1GBO72NnsHV7_OOSw-1; Tue, 26 Sep 2023 06:52:00 -0400
X-MC-Unique: m1IEU1GBO72NnsHV7_OOSw-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5219ceead33so6558729a12.2
        for <linux-next@vger.kernel.org>; Tue, 26 Sep 2023 03:52:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695725519; x=1696330319;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X4uB88kvmb2OybCMfZJsL98qGlQf9b7gdl07NjAzN9g=;
        b=QSmFcgPYa7VFqy9u+LsX6dMfq+v5XW17yXAm/KB1gQF9C89XkdFhL7upUAoWsFzU6O
         CF3Kw4AWwX7C3IOl95QdAJS0WjTbX/mA2QMrPa/V1ehPs+8BWkC6eP3QVWdxNgqET9D7
         Sla+BYFY0AtYzZbKB+3Ck4hP7QuXqrTIUVWnW13jtoniRRIVIFz861Uwigpcsovj3941
         mM+BUPFt6IwrtPrj1gJzGTi+3BeOUM8CcET/HObShBSRAbd+LYFhbtMsXNtyuNkWnYLq
         GI9mEDhDPjZbCVsXCVyS1ewzIxQQr0VmhURB96D0uxBGHluzHiGyIJKty4k+Mnk9zJvH
         TxNg==
X-Gm-Message-State: AOJu0YzfCNDQvgQrzTi7y7yiEupmSyQfNt+kcb8lsUTiZUjYa0MZGx7W
        1K1AR9nyADhH4kSKUZyW0VyFTxwsp1f0Qc0rlAu9+uA8RD8utGK4yZv1hAjVBaG2RF0mthLorR2
        MHK05V26SyH1rdtMDJKIC2IHovrA31w==
X-Received: by 2002:a05:6402:656:b0:522:3d36:ff27 with SMTP id u22-20020a056402065600b005223d36ff27mr8070676edx.31.1695725519470;
        Tue, 26 Sep 2023 03:51:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEH8nf0IVOQ5bt/LShjdqPKghaz5yxg+NopLj8GcqKnHIkhSFwCF49cSfbnTsxDOW26ExwKZQ==
X-Received: by 2002:a05:6402:656:b0:522:3d36:ff27 with SMTP id u22-20020a056402065600b005223d36ff27mr8070663edx.31.1695725519158;
        Tue, 26 Sep 2023 03:51:59 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id d15-20020aa7d68f000000b005333922efb0sm6627881edr.78.2023.09.26.03.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 03:51:58 -0700 (PDT)
From:   Danilo Krummrich <dakr@redhat.com>
To:     dri-devel@lists.freedesktop.org, sfr@canb.auug.org.au
Cc:     daniel.vetter@ffwll.ch, linux-next@vger.kernel.org,
        linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@redhat.com>
Subject: [PATCH] drm/gpuvm: doc: fix filename references
Date:   Tue, 26 Sep 2023 12:51:28 +0200
Message-ID: <20230926105146.10808-1-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Commit f72c2db47080 ("drm/gpuvm: rename struct drm_gpuva_manager to
struct drm_gpuvm") did also change the corresponding filenames which are
referenced from the documentation, but were not adjusted accordingly.
Hence, fix up those filenames.

Fixes: f72c2db47080 ("drm/gpuvm: rename struct drm_gpuva_manager to struct drm_gpuvm")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/dri-devel/20230926150725.4cca5fc5@canb.auug.org.au/
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 Documentation/gpu/drm-mm.rst | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
index c19b34b1c0ed..602010cb6894 100644
--- a/Documentation/gpu/drm-mm.rst
+++ b/Documentation/gpu/drm-mm.rst
@@ -466,40 +466,40 @@ DRM MM Range Allocator Function References
 .. kernel-doc:: drivers/gpu/drm/drm_mm.c
    :export:
 
-DRM GPU VA Manager
-==================
+DRM GPUVM
+=========
 
 Overview
 --------
 
-.. kernel-doc:: drivers/gpu/drm/drm_gpuva_mgr.c
+.. kernel-doc:: drivers/gpu/drm/drm_gpuvm.c
    :doc: Overview
 
 Split and Merge
 ---------------
 
-.. kernel-doc:: drivers/gpu/drm/drm_gpuva_mgr.c
+.. kernel-doc:: drivers/gpu/drm/drm_gpuvm.c
    :doc: Split and Merge
 
 Locking
 -------
 
-.. kernel-doc:: drivers/gpu/drm/drm_gpuva_mgr.c
+.. kernel-doc:: drivers/gpu/drm/drm_gpuvm.c
    :doc: Locking
 
 Examples
 --------
 
-.. kernel-doc:: drivers/gpu/drm/drm_gpuva_mgr.c
+.. kernel-doc:: drivers/gpu/drm/drm_gpuvm.c
    :doc: Examples
 
-DRM GPU VA Manager Function References
---------------------------------------
+DRM GPUVM Function References
+-----------------------------
 
-.. kernel-doc:: include/drm/drm_gpuva_mgr.h
+.. kernel-doc:: include/drm/drm_gpuvm.h
    :internal:
 
-.. kernel-doc:: drivers/gpu/drm/drm_gpuva_mgr.c
+.. kernel-doc:: drivers/gpu/drm/drm_gpuvm.c
    :export:
 
 DRM Buddy Allocator
-- 
2.41.0

