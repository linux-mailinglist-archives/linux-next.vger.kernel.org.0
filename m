Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C5D34FF1BA
	for <lists+linux-next@lfdr.de>; Wed, 13 Apr 2022 10:23:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233193AbiDMIZz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 13 Apr 2022 04:25:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231696AbiDMIZz (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 13 Apr 2022 04:25:55 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBEEE33E8B
        for <linux-next@vger.kernel.org>; Wed, 13 Apr 2022 01:23:34 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id s18so2473928ejr.0
        for <linux-next@vger.kernel.org>; Wed, 13 Apr 2022 01:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=pDdCO2Z9sHAkcidfpKBTGhIx4GsRFl2YRA+5zMVZ7Po=;
        b=EQSfe/OGM1bDLSi6whKMEjNq4/6t5obsX6B3zW3tIoZLjKAB8+dPT5hT7TZitAkSiT
         fTwT0mW7viCTIF4OAb5wBT0PlPjORofhAKFSzh9V9G3tcQa7lEhUL13MOzBriYY+fqmc
         IVVRwfNl3wO2clI7usFeV426Mk2ctlMr3lIpc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=pDdCO2Z9sHAkcidfpKBTGhIx4GsRFl2YRA+5zMVZ7Po=;
        b=sSC908ZVufHaRw/z5Ue+eXYlkTEzEhSQpbokZ8ALfaHHGW8Xm5xNj4JHHTUT4zCN6g
         Pf4C1TOQmJzfe/TXS7BZO4V7YYKfr5ovFHW6sOYQA2v+vuJ45G0nU0lZ0J0XbuHcVXvt
         sfNTDm7dP1rZWL964P+NKfJQekpjN6R18e7HxI6jqf/n/zkM5auQiRpH1k9d4Sxnr8Sk
         13eZMRYhy8EeCxcXkz2JfXLgfcpZoqEKez+ygKe680nzpsdmbkl/vA/zfyZ0gp3iYsbz
         VOTEXc1wFMJmJZkIYZ6ntCbDo3/1p4/pKUnPyQeL0iikQdvL2+pGfo2QtWRfWkoOqsMF
         0UXA==
X-Gm-Message-State: AOAM530tHUv1wtV3WWjZeQAqOoMZdhhap8m+1vnB1UwgiIAjzubNuQBi
        BQ/Mlj+YY76jR4659dV/bhAh0A==
X-Google-Smtp-Source: ABdhPJy6vkhPnQjZPHpvyKo4dmGeTKsNWOhUCSOfAThna7ZkD4GSLlcdAsCMZnlM5vvm+zfGBdc8Tw==
X-Received: by 2002:a17:907:94cd:b0:6e0:b001:aeb6 with SMTP id dn13-20020a17090794cd00b006e0b001aeb6mr37652242ejc.283.1649838213381;
        Wed, 13 Apr 2022 01:23:33 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id k11-20020a50c8cb000000b0041d97e9fd46sm879363edh.83.2022.04.13.01.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Apr 2022 01:23:32 -0700 (PDT)
Date:   Wed, 13 Apr 2022 10:23:31 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Dave Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the drm-misc tree
Message-ID: <YlaIgxknwmPbsg1h@phenom.ffwll.local>
Mail-Followup-To: Stephen Rothwell <sfr@canb.auug.org.au>,
        Dave Airlie <airlied@linux.ie>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20220406155030.0dacf051@canb.auug.org.au>
 <20220413100448.6f5f4de7@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220413100448.6f5f4de7@canb.auug.org.au>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Apr 13, 2022 at 10:04:48AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> On Wed, 6 Apr 2022 15:50:30 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > After merging the drm-misc tree, today's linux-next build (htmldocs)
> > produced this warning:
> > 
> > include/drm/ttm/ttm_resource.h:226: warning: Function parameter or member 'pos' not described in 'ttm_lru_bulk_move'
> > 
> > Introduced by commit
> > 
> >   b0e2c9ea5afc ("drm/ttm: allow bulk moves for all domains")
> 
> This warning is now produced by the drm tree.

Christian, do you have a patch to fix this?
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
