Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EDC7F7E15AE
	for <lists+linux-next@lfdr.de>; Sun,  5 Nov 2023 18:56:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229470AbjKER4B (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 5 Nov 2023 12:56:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229455AbjKER4A (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 5 Nov 2023 12:56:00 -0500
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25F3BDB
        for <linux-next@vger.kernel.org>; Sun,  5 Nov 2023 09:55:58 -0800 (PST)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1c9b7c234a7so33750275ad.3
        for <linux-next@vger.kernel.org>; Sun, 05 Nov 2023 09:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699206957; x=1699811757; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HIXC95EsfE1M+IH5iNxhZaF/mLKVXVH52rDOYhksDf4=;
        b=flL9EMKchoc8Ep6t5N9Y7m3hraTTbzM/0Km871ec4Nph5kZEfb+oj5Hc2uesv39pGo
         0X+8rIog7tWoak1xHPFAETjugGDKhXfw/f5nQP0fmPHUTJwm/XVJkcdME21nNjsyAzss
         YErsrWm+7YF8ZimCai35yI7hNLFXVttUGQcv5eXJ+pDLzmoBFS1eQi82eusLu+CK4NVT
         zPyZ1FVcVVnrEMGolq1FKT+C/G9QxmfFZ5Ucuz3K04Hg7DOfYzUzUlv0fJ01Qe7xoT94
         wK4ve/S3VfM4TO4NAknvaxrArYmJcDEOY5iuakIumdNGxE3GEUla890K7HJe8Ru7LtV3
         ywCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699206957; x=1699811757;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HIXC95EsfE1M+IH5iNxhZaF/mLKVXVH52rDOYhksDf4=;
        b=hxxOLPEphxwDEuUOz15I/ra71bFHqAVtUz34mBjHyT5OjaAjs8H2vnnZnqtZiyzSkp
         LPRGY8jTuyhNERCVV71UxfmoX0UNJcT+Djgn4r099wLx+MQz0vNJzKtjO6vgU+SZ+8Ku
         TDh86DYHHrbiKa2tFg/CTyOherQLKAzCsI+ExzvNsJPtOdYiXSK+eESnEjETxBxlUURw
         uAAsuDFk3+D5agYRTKcfPB71wyYX8igo9cQzp5bL6DcRli7N7H4up9DU2mjfH+H4wdMD
         IewolhUKOpb8eCWSuoQGTrnPjT8gmEkjX2VVoflDq7LSGKqQ/4vmih4V+Q845siOIMah
         /Q8Q==
X-Gm-Message-State: AOJu0Yz4twtLao8r4iwZ6wJqvmr6+RTya++Tx6Mx7XDcibG6MZbuvjbu
        gJdYxE7rk6ZtASWiRxadMl2XQe/Cf3g=
X-Google-Smtp-Source: AGHT+IFBLGY54PYhYsI+r9J0zFjt+Lj9MUAmvwx6SjMhszUI82oqENWEtbcEZk5jA75+E2fw/54IEQ==
X-Received: by 2002:a17:902:ecce:b0:1cc:59a1:79c6 with SMTP id a14-20020a170902ecce00b001cc59a179c6mr22992191plh.18.1699206957551;
        Sun, 05 Nov 2023 09:55:57 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id m15-20020a170902db0f00b001c7443d0890sm3062865plx.102.2023.11.05.09.55.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Nov 2023 09:55:56 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sun, 5 Nov 2023 09:55:55 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Alex Deucher <alexander.deucher@amd.com>,
        Chaitanya Dhere <chaitanya.dhere@amd.com>,
        Roman Li <roman.li@amd.com>, linux-next@vger.kernel.org,
        amd-gfx@lists.freedesktop.org
Subject: Re: [PATCH 2/2] drm/amd/display: Fix stack size issue on DML2
Message-ID: <aa6344f8-abd4-4f9e-86cf-febecd6fd747@roeck-us.net>
References: <20231016142031.241912-1-Rodrigo.Siqueira@amd.com>
 <20231016142031.241912-3-Rodrigo.Siqueira@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231016142031.241912-3-Rodrigo.Siqueira@amd.com>
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Oct 16, 2023 at 08:19:18AM -0600, Rodrigo Siqueira wrote:
> This commit is the last part of the fix that reduces the stack size in
> the DML2 code.
> 

That does not really help when trying to build allmodconfig or allyesconfig
with gcc 11.4 or 12.3.

drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_core.c: In function 'dml_prefetch_check':
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_core.c:6707:1: error: the frame size of 2056 bytes is larger than 2048 bytes

This is with v6.6-14500-g1c41041124bd.

I am overwriting it by forcing CONFIG_FRAME_WARN=0 in my test builds for
x86_64, but of course that affects all code. Maybe consider increasing
frame-larger-than in drivers/gpu/drm/amd/display/dc/dml2/Makefile ?
Currently it is

ifneq ($(CONFIG_FRAME_WARN),0)
frame_warn_flag := -Wframe-larger-than=2048
endif

Guenter
