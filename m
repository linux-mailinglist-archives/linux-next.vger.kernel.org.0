Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 475524EF965
	for <lists+linux-next@lfdr.de>; Fri,  1 Apr 2022 19:57:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240274AbiDAR7o (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 1 Apr 2022 13:59:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231842AbiDAR7o (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 1 Apr 2022 13:59:44 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49F9520A941
        for <linux-next@vger.kernel.org>; Fri,  1 Apr 2022 10:57:54 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id bt26so6329655lfb.3
        for <linux-next@vger.kernel.org>; Fri, 01 Apr 2022 10:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fungible.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JvhYeVuiyHzD2XZ5Sv6yl6UpWLRVligCuXo9RsgwXcc=;
        b=gus+G3NKsoMAx1p9mych9MlnHzYDB3gBK5/+lInIhjhpc4I7FWao+babG4/sJ9GNJ2
         YYElr7WYxvEm7tE47uBGZd1aREwnvxMa+JwEgv4Ddz0lvnyK1iVOAGaIadg9J+FssOYB
         wQQHQing6CY+riYLM2tpNTjcNVS4V2N/UQ1wQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JvhYeVuiyHzD2XZ5Sv6yl6UpWLRVligCuXo9RsgwXcc=;
        b=3XXijlFzhKDpFlZV7hVdN+3FYNToHUuP24QksjFeoaQ6r4CcTgqdP7QKAx/VMK0K4T
         k83uRuEa3lZg5IbyaMzfe8hhqZ6e85X/3UKa0rAAo4a8T/SxBnAYGdyg/VqeqKJsFRUJ
         ro6gmRdE0oG4xkFw43pwmPiA4PKqYwiT2PHucG2/em8NNnXto0bCL3D4CuV/8elyY0JI
         US/MFqg/cCo3QVZ/NvUbJQVyyZfR042ahW4deassDjgAZSHGMZRMgE/Ed17dy60u5whN
         GpwmMt5qm8wqctL8DhPT3mccWRiHdercMg1ra3hD8sl/URcxjiSwQK2UR6lci0t/RtJu
         ZP0Q==
X-Gm-Message-State: AOAM532DFgjafY5GejDpjVPdsF4Ai14NubjEqKoAIBE1vl6nSG6QK4gD
        i4aWYFAAjH6uihg0Ocx4vpe29LFLi+q7pnxIZ9WsN7/M0iI1gA==
X-Google-Smtp-Source: ABdhPJxWQ+i+ITn0cTBp8HpNpYi+FsZ+tLlRK5zUpDEx6eXcl5SqgGujjoEi601Spl5n8pBWofs9JC8n72Sl/3ZAbrY=
X-Received: by 2002:a05:6512:11eb:b0:448:8cd0:7d7e with SMTP id
 p11-20020a05651211eb00b004488cd07d7emr14517234lfs.593.1648835872472; Fri, 01
 Apr 2022 10:57:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220401033845.8359AC2BBE4@smtp.kernel.org> <048945eb-dd6b-c1b6-1430-973f70b4dda5@infradead.org>
 <20220401100418.7c109f81@kernel.org>
In-Reply-To: <20220401100418.7c109f81@kernel.org>
From:   Dimitris Michailidis <d.michailidis@fungible.com>
Date:   Fri, 1 Apr 2022 10:57:38 -0700
Message-ID: <CAOkoqZncM3JMQvcbaixuBPg43=Da2ac2JjZAfWRt_Ezs2CCyOg@mail.gmail.com>
Subject: Re: mmotm 2022-03-31-20-37 uploaded (drivers/net/ethernet/fungible/funcore/fun_dev.o)
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Dimitris Michailidis <dmichail@fungible.com>,
        Andrew Morton <akpm@linux-foundation.org>, broonie@kernel.org,
        mhocko@suse.cz, Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        mm-commits@vger.kernel.org,
        Network Development <netdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Apr 1, 2022 at 10:04 AM Jakub Kicinski <kuba@kernel.org> wrote:
>
> On Thu, 31 Mar 2022 22:15:15 -0700 Randy Dunlap wrote:
> > On 3/31/22 20:38, Andrew Morton wrote:
> > > The mm-of-the-moment snapshot 2022-03-31-20-37 has been uploaded to
> > >
> > >    https://www.ozlabs.org/~akpm/mmotm/
> > >
> > > mmotm-readme.txt says
> > >
> > > README for mm-of-the-moment:
> > >
> > > https://www.ozlabs.org/~akpm/mmotm/
> > >
> > > This is a snapshot of my -mm patch queue.  Uploaded at random hopefully
> > > more than once a week.
> > >
> > > You will need quilt to apply these patches to the latest Linus release (5.x
> > > or 5.x-rcY).  The series file is in broken-out.tar.gz and is duplicated in
> > > https://ozlabs.org/~akpm/mmotm/series
> >
> > on i386:
> >
> > ld: drivers/net/ethernet/fungible/funcore/fun_dev.o: in function `fun_dev_enable':
> > (.text+0xe1a): undefined reference to `__udivdi3'
>
> Doesn't fail here.
>
> Oh... Probably this:
>
>         num_dbs = (pci_resource_len(pdev, 0) - NVME_REG_DBS) /
>                   (fdev->db_stride * 4);
>
> The bad config must have 64b resource length. Dimitris, PTAL.

I built last night with the mm tree from github tagged
v5.17-mmotm-2022-03-31-20-37, i386 allmodconfig. It didn't reach the
link stage due to other errors but I looked at fun_dev.o with nm, it
didn't have a reference to __udivdi3. It may need a PAE config, I'll
try that.
