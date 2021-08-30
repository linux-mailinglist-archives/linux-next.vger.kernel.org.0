Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BE0C3FBF8D
	for <lists+linux-next@lfdr.de>; Tue, 31 Aug 2021 01:59:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233594AbhH3Xv4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 30 Aug 2021 19:51:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233413AbhH3Xvz (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 30 Aug 2021 19:51:55 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA01BC06175F
        for <linux-next@vger.kernel.org>; Mon, 30 Aug 2021 16:51:01 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id fz10so10616375pjb.0
        for <linux-next@vger.kernel.org>; Mon, 30 Aug 2021 16:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:user-agent:in-reply-to:references
         :message-id:mime-version:content-transfer-encoding;
        bh=QpDnj/gbTSlTTI+0Cuvf+c8ybTVj1MAA1MmBoMrdPKQ=;
        b=QA3kvRJDOHzrFYi1FTE+M1ulgPLkGVSCeHPwSWVtPySWqHl6yRUzMFr23po46UqpMA
         cNVwlfgbrwZAj5/mwupStlXxlA3T2sBUXQCohzqeKJ/N/zaP0AI3ZlWsopxMWTWTl06t
         9+Ch/8lig/aJ5cobVV5vvtjVJoDeFgghLjMg8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:user-agent:in-reply-to
         :references:message-id:mime-version:content-transfer-encoding;
        bh=QpDnj/gbTSlTTI+0Cuvf+c8ybTVj1MAA1MmBoMrdPKQ=;
        b=HP258NHx/wH9o+dOy3C4YSsl3JPSLunmYZKeHWUwTzTE0ZR2lymasZEGr4vQEhhy9E
         ghtOAdyYN6Un+zTDhRIrY3YVR6ox3ks/a2uuSzRn+gC2zt38PsPdVsA8EDYJnOsmomSG
         VM5XwJUHpyflgSxGwWv4Z+zTAhT2OrmgHUpPgVSK5ZFai3pkIotA5L2Q6OdJ74b63d+R
         KaweFbzEXgNx8+nzGHf9CrXjGb8sZ4IZybgoPh4TUVhzxSAPg4OX0K81IUxdzcJmhFQ0
         hEkYIVQ49FoOiliQ97h9URprH1moTlxgdkkUTrTnBcvDs1qpZnlPsoHo3wEwv8cNPSs0
         cecA==
X-Gm-Message-State: AOAM533xdQTP8zV3R1h4BTEwiVaezCWvyeeGJQF6IfvzlAM6QmCGqhLO
        e30gDTk4qRqbyRDh64b+4Uvp1w==
X-Google-Smtp-Source: ABdhPJx9TtoJCj+nJXhLjMh8BIclMcgzag6XdRaQ4nesAWyW/7VRkZiSBRpwzLchk706OV68aRQu/g==
X-Received: by 2002:a17:902:e801:b0:138:b813:f928 with SMTP id u1-20020a170902e80100b00138b813f928mr1969667plg.16.1630367461242;
        Mon, 30 Aug 2021 16:51:01 -0700 (PDT)
Received: from [127.0.0.1] (173-164-112-133-Oregon.hfc.comcastbusiness.net. [173.164.112.133])
        by smtp.gmail.com with ESMTPSA id 17sm60842pfm.172.2021.08.30.16.50.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Aug 2021 16:51:00 -0700 (PDT)
Date:   Mon, 30 Aug 2021 16:50:55 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
CC:     "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
        Sam Ravnborg <sam@ravnborg.org>, edmund.j.dea@intel.com
Subject: Re: linux-next: build warning after merge of the kspp tree
User-Agent: K-9 Mail for Android
In-Reply-To: <20210830184429.1ee4b4d8@canb.auug.org.au>
References: <20210830184429.1ee4b4d8@canb.auug.org.au>
Message-ID: <E98E0D1B-4865-4177-A98F-8274B699E25E@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



On August 30, 2021 1:44:29 AM PDT, Stephen Rothwell <sfr@canb=2Eauug=2Eorg=
=2Eau> wrote:
>Hi all,
>
>After merging the kspp tree, today's linux-next build (powerpc
>allyesconfig) produced this warning:
>
>drivers/gpu/drm/kmb/kmb_plane=2Ec:135:20: warning: array subscript 3 is a=
bove array bounds of 'struct layer_status[1]' [-Warray-bounds]
>  135 |   kmb->plane_status[plane_id]=2Ectrl =3D LCD_CTRL_GL2_ENABLE;
>      |   ~~~~~~~~~~~~~~~~~^~~~~~~~~~
>In file included from drivers/gpu/drm/kmb/kmb_plane=2Ec:17:
>drivers/gpu/drm/kmb/kmb_drv=2Eh:48:23: note: while referencing 'plane_sta=
tus'
>   48 |  struct layer_status  plane_status[KMB_MAX_PLANES];
>      |                       ^~~~~~~~~~~~

Hi!

Ah yes, thanks for the report=2E I encountered this too, and have been tol=
d the warning will go away soon:
https://lore=2Ekernel=2Eorg/lkml/BY5PR11MB4182ABD607EB99C1F68777928CC69@BY=
5PR11MB4182=2Enamprd11=2Eprod=2Eoutlook=2Ecom/

-Kees

