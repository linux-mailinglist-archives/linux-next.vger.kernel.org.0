Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43E516E0954
	for <lists+linux-next@lfdr.de>; Thu, 13 Apr 2023 10:52:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229746AbjDMIwe (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 13 Apr 2023 04:52:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229561AbjDMIwc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 13 Apr 2023 04:52:32 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 871A883C3
        for <linux-next@vger.kernel.org>; Thu, 13 Apr 2023 01:52:31 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-94a34c299d8so63777366b.1
        for <linux-next@vger.kernel.org>; Thu, 13 Apr 2023 01:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1681375950; x=1683967950;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sMMjHV++lPnl4wWzVLV07WrqF25wdRQCEiHAGrnakwo=;
        b=INrZj4xUMYQleS3Tx0LtKxYjZNVyRan13czZwek2zaZq+oy39DSKAYUFN9zXZsSGPZ
         IXQZK/sDw+V0IgvjzKewBgW6py3GA2DRPcWTwNYJ05NvKTvZn7J2kI4A5nD8sI9CbXlD
         RyrJ2xSNhywHxQ3U06eSns8zC8LvAXHccrXpM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681375950; x=1683967950;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sMMjHV++lPnl4wWzVLV07WrqF25wdRQCEiHAGrnakwo=;
        b=BTlCy905aivBiDCHEDLHTkMmNDrvZBS8OmX1E9RaZtgF5/ZWfJUTx/FTbzFkK1Y79s
         dga4t66NlTSr3M0794QzBH+WsqO4ra6WxoINKntoX67FBrF/6rxKWxsY3sS3GdJ4rhOp
         oFSQhkBgklG9pU1CSkx/Jl7fkq06klH+e3symrV22z8iHHllAGc6lIHzExgQnvykh+mX
         A9SLrWclzViNUU6xBAb5mgXqscedE7K4DoGgOx2TPvTaGVXxRSZnQcek2Tv2iy8Z9C8z
         StHphihqiOq6sF+t0rX8g37vMIezVY0cAD2SUHIZEwnBMVC5BhC0KtRm1Lpl5JEWsESC
         FMBQ==
X-Gm-Message-State: AAQBX9ctfBMVhlK+X9LXrYiBO41Zcd7JH2uLGCo5znqOJJkJhhbAMYEQ
        Hbq14/NoD2ctWyvIA55KtueJMw==
X-Google-Smtp-Source: AKy350a1UdfdCDMoh8AkhQ+QpH0nAND8dfeQm38GUk7NQxrjob5RulYvkLQeppGy8jxDZbBiENNV6g==
X-Received: by 2002:a05:6402:34d0:b0:506:6c2a:528f with SMTP id w16-20020a05640234d000b005066c2a528fmr2140795edc.4.1681375950078;
        Thu, 13 Apr 2023 01:52:30 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net. [212.51.149.33])
        by smtp.gmail.com with ESMTPSA id s4-20020aa7c544000000b004fc649481basm535310edr.58.2023.04.13.01.52.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Apr 2023 01:52:29 -0700 (PDT)
Date:   Thu, 13 Apr 2023 10:52:27 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Jeffrey Hugo <quic_jhugo@quicinc.com>, daniel@ffwll.ch,
        sfr@canb.auug.org.au, ogabbay@kernel.org,
        jacek.lawrynowicz@linux.intel.com, quic_pkanojiy@quicinc.com,
        mani@kernel.org, airlied@redhat.com,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-next@vger.kernel.org
Subject: Re: [PATCH] Revert "accel/qaic: Add mhi_qaic_cntl"
Message-ID: <ZDfCyyljbvTrNpeg@phenom.ffwll.local>
Mail-Followup-To: Greg KH <gregkh@linuxfoundation.org>,
        Jeffrey Hugo <quic_jhugo@quicinc.com>, sfr@canb.auug.org.au,
        ogabbay@kernel.org, jacek.lawrynowicz@linux.intel.com,
        quic_pkanojiy@quicinc.com, mani@kernel.org, airlied@redhat.com,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-next@vger.kernel.org
References: <1681307864-3782-1-git-send-email-quic_jhugo@quicinc.com>
 <2023041201-underwear-consumer-1eb8@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023041201-underwear-consumer-1eb8@gregkh>
X-Operating-System: Linux phenom 6.1.0-7-amd64 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Apr 12, 2023 at 07:15:43PM +0200, Greg KH wrote:
> On Wed, Apr 12, 2023 at 07:57:44AM -0600, Jeffrey Hugo wrote:
> > This reverts commit 566fc96198b4bb07ca6806386956669881225271.
> > 
> > This exposes a userspace API that is still under debate.  Revert the
> > change before the uAPI gets exposed to avoid making a mistake.  QAIC is
> > otherwise still functional.
> > 
> > Suggested-by: Daniel Vetter <daniel@ffwll.ch>
> > Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> > Reviewed-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> 
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
> And can you cc: me when you resubmit this?  It's not really correct in a
> number of places and can be made simpler if you really want to have your
> own class and device major.

+1 on this, in the other thread my take was that this should go through
driver model tree in the mhi bus, and I guess needs some review there
about safety and all that. We do a lot of funny uapi in drm/accel, but
full generic driver-in-userspace is really not our thing :-)

I guess there's also the question whether this should be debugfs (like the
usb stuff, or did that move by now) or real chardev. Might also make sense
to integrate with vfio/mdev/iommufd depending how the security model
works.

But really this is all stuff where I'm hightailing it asap :-)
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
