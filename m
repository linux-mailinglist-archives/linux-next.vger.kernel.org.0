Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F139C43D9D1
	for <lists+linux-next@lfdr.de>; Thu, 28 Oct 2021 05:22:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229792AbhJ1DYx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 27 Oct 2021 23:24:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229704AbhJ1DYx (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 27 Oct 2021 23:24:53 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D972C061570;
        Wed, 27 Oct 2021 20:22:27 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id x16-20020a9d7050000000b00553d5d169f7so4970159otj.6;
        Wed, 27 Oct 2021 20:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5s4StmHI8iYxy7i8cyeJSVr9mk1BwTCxomSITB1pSno=;
        b=j0xgAgrjHYQ5lLxNU677Dz084gx6BKYrnofb/lNen5QG6+ndlB5fsn2SMU+RCx28la
         IoK6SGz+3hm5CiJOC+qWFV2os2R1nXML4yjdaZlGem5/YIknGHavWRZNNJYPHNWGAtzC
         +Wtldac1BYGHu2mg6ykF0sHoZMXflgRQyspWNFpkFzQgdy8/4QgLEzo+HhnNfVt7/1By
         TEQziQJfOPVz1YEgmpXxji/ZRxgJUEmFIk11MURALQkrzmSztqdDzuKjjf4DQGehy6o1
         D8qpJf4MeNEfxMEMuyKWDuCXmN/G68ypsKwpFYiZsN9DS7DO6B0QAdg7IfszdjIBrsoJ
         yjxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5s4StmHI8iYxy7i8cyeJSVr9mk1BwTCxomSITB1pSno=;
        b=3AacCeztpuvXADTs6Bla5Ylnl4LyGeHg2MnEkd1nuAn/qb9tQn7v08fOkFOx1hSBO+
         xMmHtlBT0WmhLAsX8kk5yg9Qfgnt+XoeFnD9gt8GbU/6eZwsxcM2iirjNmfiEiUOmg5k
         h8Nf4oMjPK/2Twa8kJ0JqmovtZwR067A/QiALc+eucpynZdHK+QClJ/PRcx07icvREy5
         bSlELa6FeMkl1Z76PklyeMQuNmTgJCzWyTx04KoitXQQox46JRPDfNkrr7fyincdc6sG
         N7QciG6DFZ20X3QAYtJaaQMCPQaXKSPmRH7v29dxNiv0S+JVBCJbEBoNFWOqNMO1o28c
         HgZA==
X-Gm-Message-State: AOAM5324AkL53vWbj62Spl1+E470IRXvs08FkLqE9ooOhiFeuI/nFrru
        qe/9CtpOiiYXekXyB+etTTSn/jqQ5cdbGhOvBDw=
X-Google-Smtp-Source: ABdhPJzQpleeZm2BZiizYujx18/yGLF9n7JjAxk+5zP6ToHPqMkuMlrjUuS7lUkavWlq8YA5IzY9ZBfIyhOmP9rDNIk=
X-Received: by 2002:a9d:1b4f:: with SMTP id l73mr1425647otl.200.1635391346481;
 Wed, 27 Oct 2021 20:22:26 -0700 (PDT)
MIME-Version: 1.0
References: <20211028140644.7c1a7244@canb.auug.org.au>
In-Reply-To: <20211028140644.7c1a7244@canb.auug.org.au>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Wed, 27 Oct 2021 23:22:15 -0400
Message-ID: <CADnq5_PLXWpPK=BV6AS8QaPcnAr8JELF8u2Cvn_FCqJwB33AMg@mail.gmail.com>
Subject: Re: linux-next: manual merge of the amdgpu tree with the drm tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>,
        Alex Deucher <alexander.deucher@amd.com>,
        Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
        Fangzhi Zuo <Jerry.Zuo@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Lyude Paul <lyude@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Oct 27, 2021 at 11:06 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Today's linux-next merge of the amdgpu tree got conflicts in:
>
>   drivers/gpu/drm/amd/display/dc/core/dc_link.c
>   drivers/gpu/drm/drm_dp_mst_topology.c
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>
> between commits:
>
>   d740e0bf8ed4 ("drm/amd/display: Add DP 2.0 MST DC Support")
>   41724ea273cd ("drm/amd/display: Add DP 2.0 MST DM Support")
>   00f965e700ef ("drm/amdgpu/display: fix build when CONFIG_DRM_AMD_DC_DCN is not set")
>
> from the drm tree and commits:
>
>   6d23be5bc661 ("drm/amd/display: Add DP 2.0 MST DC Support")
>   39b3c728e5ca ("drm/amd/display: Add DP 2.0 MST DM Support")
>   8bc3824f0ee2 ("drm/amdgpu/display: fix build when CONFIG_DRM_AMD_DC_DCN is not set")
>
> from the amdgpu tree.
>
> The conflicts between these different versions of the same patches,
> and some other changes in the amdgpu tree are just a mess today, do I
> have just dropped the amdgpu tree completely for today.

Those patches were just in my tree while I was waiting for the topic
branch to land in drm-next.  I'll drop them from my tree tomorrow.

Alex

>
> --
> Cheers,
> Stephen Rothwell
