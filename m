Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7170676D07A
	for <lists+linux-next@lfdr.de>; Wed,  2 Aug 2023 16:48:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233568AbjHBOsF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 2 Aug 2023 10:48:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234542AbjHBOsC (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 2 Aug 2023 10:48:02 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D0C11982
        for <linux-next@vger.kernel.org>; Wed,  2 Aug 2023 07:48:00 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1bbd2761f1bso58111345ad.2
        for <linux-next@vger.kernel.org>; Wed, 02 Aug 2023 07:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1690987680; x=1691592480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VppVRXoXQvKZJkFtuRWaz8mbgEZARAeuezBGRcJyOiM=;
        b=hFYWlhmljE/klwppV++NKW84d/Eesf+FCOvycpSLv1wwCQpDOYdQA/icP3xC4HHRIF
         7Rvw1vD7plGgiNUFEdgMDG9B+49Prm8n3Uf6scoED+cjMOwuZHCogoPVhnADisSPHX3p
         HBDr52caGrX81FAcSeufVdwOc1PdpTXeZz/FI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690987680; x=1691592480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VppVRXoXQvKZJkFtuRWaz8mbgEZARAeuezBGRcJyOiM=;
        b=SVoJhYHZ0DJ0q8LmtpOLPlJrrvv0hnzp6vt+MZcEVgNt7g+FSMgVofTYd4V7QPjiDc
         TKLFg4DLVxrYevq5rMXG89CKhiLKj5H5RyxcNgDVdr3m+kYtCuRdDAo33ikR6wp0ol2R
         WpZ3DOiu4sEpeepJYsyUfrFN9G+JgYe8PKM1W6WYyiqbHz81R8xmvI1zSJWlo7kYzlox
         RKXNuCyBtoDrG5zc9+9PpVVoImwGiXSWIVRBH+63NC0qPX+6M6lGiO967qos4qca9ful
         KjrQDT2K+EFfhUjiLZa9kfcc/gyuYAAKcS6MXYHhWw7pyXwlSO+fbZTHtnZK2YY2YKFg
         lP3Q==
X-Gm-Message-State: ABy/qLYNl0DXiV08HhvxNjw2XB6okMw30P8IBgDuTwLFKMsSHFC+pPBn
        aes800sXr/IyJdhbMvTG3atN8Q==
X-Google-Smtp-Source: APBJJlEnKVmSw5s+REAmb9vIHaq2YjWuJwo5aDKSmHQblkNG/fsPSQTcTnzDbOCmKARtJsRK9TdsIg==
X-Received: by 2002:a17:902:ec82:b0:1bb:9c45:130f with SMTP id x2-20020a170902ec8200b001bb9c45130fmr19124197plg.69.1690987680161;
        Wed, 02 Aug 2023 07:48:00 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:6fae:ec4e:7f84:d593])
        by smtp.gmail.com with ESMTPSA id b21-20020a170902d31500b001b89891bfc4sm12524139plc.199.2023.08.02.07.47.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 07:47:59 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] drm/panel: Fix todo indentation for panel prepared/enabled cleanup
Date:   Wed,  2 Aug 2023 07:47:28 -0700
Message-ID: <20230802074727.2.Iaeb7b0f7951aee6b8c090364bbc87b1ae198a857@changeid>
X-Mailer: git-send-email 2.41.0.585.gd2178a4bd4-goog
In-Reply-To: <20230802074727.1.I4036706ad5e7f45e80d41b777164258e52079cd8@changeid>
References: <20230802074727.1.I4036706ad5e7f45e80d41b777164258e52079cd8@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

In commit d2aacaf07395 ("drm/panel: Check for already prepared/enabled
in drm_panel") the formatting for a code block was not quite
right. This caused an error when building htmldocs:

  Documentation/gpu/todo.rst:469: ERROR: Unexpected indentation.

Fix the error by using the proper syntax for a code block.

Fixes: d2aacaf07395 ("drm/panel: Check for already prepared/enabled in drm_panel")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/r/20230802141724.0edce253@canb.auug.org.au
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 Documentation/gpu/todo.rst | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index aa0052f9b93b..139980487ccf 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -465,7 +465,8 @@ Clean up checks for already prepared/enabled in panels
 
 In a whole pile of panel drivers, we have code to make the
 prepare/unprepare/enable/disable callbacks behave as no-ops if they've already
-been called. To get some idea of the duplicated code, try:
+been called. To get some idea of the duplicated code, try::
+
   git grep 'if.*>prepared' -- drivers/gpu/drm/panel
   git grep 'if.*>enabled' -- drivers/gpu/drm/panel
 
-- 
2.41.0.585.gd2178a4bd4-goog

