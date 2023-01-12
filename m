Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3CE24668734
	for <lists+linux-next@lfdr.de>; Thu, 12 Jan 2023 23:46:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233877AbjALWqX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 12 Jan 2023 17:46:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240575AbjALWqC (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 12 Jan 2023 17:46:02 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B26D5EC1C
        for <linux-next@vger.kernel.org>; Thu, 12 Jan 2023 14:45:42 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id z1-20020a17090a66c100b00226f05b9595so7464461pjl.0
        for <linux-next@vger.kernel.org>; Thu, 12 Jan 2023 14:45:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ooim2Wn4nxPzype/U3O2bg5SkJtVRY7qsQNtyTRmags=;
        b=YGaM1pN0C8twUIzQgGfKjkYks+VnXiObKg1aQaTkoY3olojecUD3RTItE7YfBzxsXQ
         ap49M0nIV5gwf/pkXPjh3bX8XHcHw2MqaSz2nwdIGfXeyGzq/xzLxr3Cigh1uBhm0PdQ
         xXPPrdT6WSBM60Mci5MPFJD/YztPmxYo5yMbg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ooim2Wn4nxPzype/U3O2bg5SkJtVRY7qsQNtyTRmags=;
        b=OCu3JFDZ4ZgV4wofMrY6fSIoBhRMquWhyGtrVyhAD0s+9inAR6tsK30O5+oQKqoZ/Z
         E/LhfAfRKx1OYJ/b6Z9vusD8mNQN558eW/lnaZKBE1CMV11Fymd5zd4Qtsrzv+U94TOJ
         0UM2xoUmNSJXJZiLBnY1SWk+0xALkdk4O7EppkpCigNHq5NU0Lu7dhwb/izzXip0edfV
         2ZFMkMzs3P0siDDDaOqf+ujBG2I119vANCUWmtN319PkWLRvlr8S41DfLd+d9rBR1aGF
         fQqLHG1MtHLcFv7CzqOeMqltUYE9b42+mBLgvoF+S3zFHAD8Yt+HIIdM+qydRcQX7bxp
         hSJg==
X-Gm-Message-State: AFqh2kq3P1L6bYCqGvsvWZMwwYXcJuoBR5iAH7ubwffVygdDgIg/Xcf5
        /BVotDz5DX2zuoqC6E4pGeTisA==
X-Google-Smtp-Source: AMrXdXvGve+4kNjBvlBdmOxwGLXehsNBREHOMLlomMlydd2DdmmiiiqSkLXYqlPUtwZFaLbLOdvQUw==
X-Received: by 2002:a17:90b:2356:b0:226:e1a0:6596 with SMTP id ms22-20020a17090b235600b00226e1a06596mr8726077pjb.12.1673563541660;
        Thu, 12 Jan 2023 14:45:41 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id y7-20020a17090a474700b00219463262desm10980238pjg.39.2023.01.12.14.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jan 2023 14:45:41 -0800 (PST)
Date:   Thu, 12 Jan 2023 14:45:40 -0800
From:   Kees Cook <keescook@chromium.org>
To:     "Limonciello, Mario" <Mario.Limonciello@amd.com>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
        "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>,
        "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>,
        "Li, Roman" <Roman.Li@amd.com>, "Zuo, Jerry" <Jerry.Zuo@amd.com>,
        "Wu, Hersen" <hersenxs.wu@amd.com>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "Koenig, Christian" <Christian.Koenig@amd.com>,
        "Lazar, Lijo" <Lijo.Lazar@amd.com>,
        "Pillai, Aurabindo" <Aurabindo.Pillai@amd.com>,
        "Wentland, Harry" <Harry.Wentland@amd.com>,
        "Deucher, Alexander" <Alexander.Deucher@amd.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@gmail.com>,
        "Pan, Xinhui" <Xinhui.Pan@amd.com>,
        "Wheeler, Daniel" <Daniel.Wheeler@amd.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
        "linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>
Subject: Re: Coverity: dm_dmub_sw_init(): Incorrect expression
Message-ID: <202301121445.393EAD9B21@keescook>
References: <202301121425.FB249B61B4@keescook>
 <MN0PR12MB6101667DFB81967706C13111E2FD9@MN0PR12MB6101.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MN0PR12MB6101667DFB81967706C13111E2FD9@MN0PR12MB6101.namprd12.prod.outlook.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Jan 12, 2023 at 10:39:20PM +0000, Limonciello, Mario wrote:
> This particular one was fixed already in https://patchwork.freedesktop.org/patch/518050/ which got applied today.

Ah-ha; thanks!

-- 
Kees Cook
