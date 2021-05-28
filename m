Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86139394811
	for <lists+linux-next@lfdr.de>; Fri, 28 May 2021 22:49:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229522AbhE1Uvc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 28 May 2021 16:51:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbhE1Uvc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 28 May 2021 16:51:32 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92A6DC061574
        for <linux-next@vger.kernel.org>; Fri, 28 May 2021 13:49:56 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id 22so4120034pfv.11
        for <linux-next@vger.kernel.org>; Fri, 28 May 2021 13:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=CiApTfhGgh/e+L4ArUyDt+4SKyIdIlsbm2ky/L8xHX0=;
        b=S+eUpGHMnFc76SU9CJ52KqM6LVLWYOp3hWmFjmafrUZc+gb9km8cOcAjY99wlFXpSB
         Cs1uJgnPCRa0Md0xfUN3qgZnm9CKOS4STvTV7IjlP6jufZ5kAbniX71lvPjR6Tv4/TyA
         LECZESVhDT9g8mTAY5YOwQktMy41BiE0CNQbhhgcqJDlATGQpNTjw1s8/3JGGW7tRcTB
         8I1SOimjqT2XnBwG8xtr0qQLDTPoDV4wnaqBDEAdJq7buXyQ+wgMZbIzoQv0qdpkdbrR
         vy0qB1tRy8/4NJrLwjE1mriJIAXajxoyFtD4mnD5Gvmzf2brcWBPMsqu7XPz/UN1PyvL
         ZuZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CiApTfhGgh/e+L4ArUyDt+4SKyIdIlsbm2ky/L8xHX0=;
        b=pKSJdF10Zn/9pR+eTc+AnnBfnxaE9FtWIK+FqSfetAoDWSbPR232OXKiLstguvPAgZ
         je3tpeQ3M8Irg+HaVz4vU0+66PcRaQOLCwulFJrNeFMSCfLAxSB1r2aK6mgFm5isxkEc
         e04p206Y7e17kxhwsvZLQUbfg9c+BjW0AHkbC7F3L6w52TfKsKQ315sHccTexVfz8Nvm
         rj0POZp9joG3+11AWKeqIqWJwCsLX84Xomsg+FWylpYW59385VPFWRFi/Shps7+4ZGyj
         nzP7F59DV6ejR904zwkEsyEx+tIAeJmECylmE5MfJ3MKdKNlDlu0TojErDDpluLU4lP1
         dU9A==
X-Gm-Message-State: AOAM5310yv1Kd/c0iwQTk9op5z8Mngl8JMkznJyD0lNKa9EPPGuGEZsG
        d9UiNx+2G3pm5yheJGpZR2s=
X-Google-Smtp-Source: ABdhPJzXyWxVLwgnGZL/J57aVQpkdXHOxKUC1ERSkAtGON2EP/au1hpP1ba1R3JdTwx833PoeEPNjQ==
X-Received: by 2002:a63:784c:: with SMTP id t73mr10831057pgc.62.1622234996195;
        Fri, 28 May 2021 13:49:56 -0700 (PDT)
Received: from hyeyoo ([183.99.11.150])
        by smtp.gmail.com with ESMTPSA id c83sm5231483pfb.10.2021.05.28.13.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 May 2021 13:49:55 -0700 (PDT)
Date:   Sat, 29 May 2021 05:49:49 +0900
From:   Hyeonggon Yoo <42.hyeyoo@gmail.com>
To:     sfr@canb.auug.org.au, nathan@kernel.org
Cc:     linux-next@vger.kernel.org
Subject: Re: OOPs when compiling with clang-11
Message-ID: <20210528204949.GA5911@hyeyoo>
References: <20210528175947.GA11557@hyeyoo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210528175947.GA11557@hyeyoo>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Sat, May 29, 2021 at 02:59:47AM +0900, Hyeonggon Yoo wrote:
> Hello Nathan and Stephen Rothwell,
> An interesting kernel bug occurred when
> compiling with clang-11.
> 
> if there's someone to be added as cc, plase add it.
> 
> I'm on 5.13.0-rc2-next-20210520,
> clang-11 is Ubuntu clang version 11.0.0-2~ubuntu20.04.1
> 
> I'll try this on linux next 20210529,
> But thought reporting is needed.
> 
> It's not clear to me if it's related with kernel or clang yet?
> (maybe kernel I think)

No problem  with 5.13.0-rc3-next-20210528.
it seems it's already fixed.

Apologize for being annoying.

Thanks,
Hyeonggon
