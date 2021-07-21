Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEFAE3D0DB6
	for <lists+linux-next@lfdr.de>; Wed, 21 Jul 2021 13:33:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235558AbhGUKvx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 21 Jul 2021 06:51:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238607AbhGUKlo (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 21 Jul 2021 06:41:44 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F25D4C061762
        for <linux-next@vger.kernel.org>; Wed, 21 Jul 2021 04:22:20 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id m11-20020a05600c3b0bb0290228f19cb433so3240613wms.0
        for <linux-next@vger.kernel.org>; Wed, 21 Jul 2021 04:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=s3GF73Lo2TCfel8Jh3jPdwfp8WqBMWjIbQRtP4xAOVQ=;
        b=vSuh/kpmcgmAPNOLZdNi9QN2JyjuioX++aaux9htcSklXhVoQ+2OCwLQTd+zgS3awq
         9mVnaFoXqqODl2RknRqerQNnBkJfTduQYIZP7sSczysVSw1dWjXse9hduPodpSt+mjOm
         jwOP+N7oDsSIbkaKFUB8Ytc0fnNBEm91IJXMg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=s3GF73Lo2TCfel8Jh3jPdwfp8WqBMWjIbQRtP4xAOVQ=;
        b=lu3sJ5Tk5ANHqGF5l0lIW1otuOODfk4rOQYVLVd4Y5cuW8lUxVsHxaLW8gg71fmy7+
         rewWpZHpAzM+zwnM0Cq+GrvH+3L+mlqC88cX/8T34DPDjmW/qnOBGBM/iKGXZ+6YXlBt
         6i3FZbUwGM8AHMTp9sW3O9pQJ8h6M1V3ND296VrWz5EAraqvcGTOuBytZNayf4/revBD
         8I/KLJrPFqgIcv2hIPgYrorjpGu0B8raOWD/lP60tea+QIxKj+e1XgeH6h6W6Pa8Q5Nk
         uVaz5ZTj+FiCBUJi5tLy8rGRwZXieeupdALmdrafrdBsbraQlfR9R9J1GZkI8gPyG61s
         rkdw==
X-Gm-Message-State: AOAM532UjkaWD2PFEbUWgt9PLQyPTsdAWxPNM0wdl2/TCcYem/JGbTe1
        UhRPfSUIqnZyMGLVJbLwW7xNBQ==
X-Google-Smtp-Source: ABdhPJy4fwnKUQQjwGClhWwQwHLYI5LPnIxVIfjSXKUeBkGOMtl6vmeUufL8PnjipscLhUSyecvgew==
X-Received: by 2002:a7b:c2fa:: with SMTP id e26mr3579721wmk.84.1626866539458;
        Wed, 21 Jul 2021 04:22:19 -0700 (PDT)
Received: from localhost ([2620:10d:c093:400::5:d571])
        by smtp.gmail.com with ESMTPSA id n5sm4777841wmd.4.2021.07.21.04.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jul 2021 04:22:18 -0700 (PDT)
Date:   Wed, 21 Jul 2021 12:22:18 +0100
From:   Chris Down <chris@chrisdown.name>
To:     Petr Mladek <pmladek@suse.com>
Cc:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the printk tree
Message-ID: <YPgDahcOZn6QNz1r@chrisdown.name>
References: <20210720174300.018cc765@canb.auug.org.au>
 <CA+G9fYs2ApGkrJHL5HOO1jEJZ714itVp+Tdj7fWzkG+JWc=pOA@mail.gmail.com>
 <YPbBfdz9srIpI+bb@chrisdown.name>
 <20210721085705.fy6hrc5n3qtlwehq@pathway.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20210721085705.fy6hrc5n3qtlwehq@pathway.suse.cz>
User-Agent: Mutt/2.1 (4b100969) (2021-06-12)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Petr Mladek writes:
>Chris, could you please send it as a proper patch?

Sure thing -- just to confirm, resend the whole series to you with these fixes 
squashed in, right? :-)
