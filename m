Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7D59CF0DA
	for <lists+linux-next@lfdr.de>; Tue,  8 Oct 2019 04:38:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729704AbfJHCiG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 7 Oct 2019 22:38:06 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:61741 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729465AbfJHCiG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 7 Oct 2019 22:38:06 -0400
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id x982c069031177;
        Tue, 8 Oct 2019 11:38:01 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com x982c069031177
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1570502281;
        bh=Lu01uISpwlRkeos8wFikDHSGIaTdmpRj+UjEAi8hqGA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=d9iwUyioYnDNCYLibYhj1EiU/r/Ego3Ru2/LVwZFqAXdFksViZ5uNiLroTejpcx1m
         I6hIRw+OIB00i1gUmsYEVLD1NddRj/O8qY8SP4fmXUCbIN2KfF5K46A+W7fQfVzrEl
         /ATjLt/Jw0dWHsLENP7jLw59MMJ8kSfoOuiASrYu5b1P7aD8ack6rVTplUlZKuaJRA
         kWJGaMFyhEUl1zLb69qPGXoHGzqetXz63Ltj5Ip4Pn/pZkXaWU1g+l3Ll7w/0oJwoM
         UkmjMBVndaGaWuiPSZwHRjuF1sTN0o0Y3nSSn/LCxmI6ap5ykpcrzsYIdztmAEhMTU
         0vS46497KMI3w==
X-Nifty-SrcIP: [209.85.221.174]
Received: by mail-vk1-f174.google.com with SMTP id d126so3457570vkf.7;
        Mon, 07 Oct 2019 19:38:01 -0700 (PDT)
X-Gm-Message-State: APjAAAVXvm2a012F6kiG1roZhFozr2C6FoEHQhb/2hNfa0F09DxIPi1T
        wZIiPfBY3rmjlh4aBCQD63p6bLVlFOP3eZ6Xb2s=
X-Google-Smtp-Source: APXvYqy2SAp1JVs3ahrffHwo2QjacEv2ID3fu19AN/hIAI/aS0gzuNg5QnD6VOJUth8N0994t7gC82fCG3wKf5ptokM=
X-Received: by 2002:a1f:9344:: with SMTP id v65mr11421289vkd.96.1570502280258;
 Mon, 07 Oct 2019 19:38:00 -0700 (PDT)
MIME-Version: 1.0
References: <20191008070525.0bdc942d@canb.auug.org.au>
In-Reply-To: <20191008070525.0bdc942d@canb.auug.org.au>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Tue, 8 Oct 2019 11:37:23 +0900
X-Gmail-Original-Message-ID: <CAK7LNASFVwS8HwncJx0_5Fn57YsO_gJ8XZmDgngD8XzTWTL9Jw@mail.gmail.com>
Message-ID: <CAK7LNASFVwS8HwncJx0_5Fn57YsO_gJ8XZmDgngD8XzTWTL9Jw@mail.gmail.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the
 kbuild-current tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

On Tue, Oct 8, 2019 at 5:05 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Commit
>
>   da6221f246f9 ("scripts: setlocalversion: fix a bashism")
>
> is missing a Signed-off-by from its committer.

I fixed it now. Thanks!


> --
> Cheers,
> Stephen Rothwell



-- 
Best Regards
Masahiro Yamada
