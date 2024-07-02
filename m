Return-Path: <linux-next+bounces-2791-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39EDC91EF31
	for <lists+linux-next@lfdr.de>; Tue,  2 Jul 2024 08:40:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5F7441C230DF
	for <lists+linux-next@lfdr.de>; Tue,  2 Jul 2024 06:40:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13FBA15381C;
	Tue,  2 Jul 2024 06:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="S2tAOdrD"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F14152536
	for <linux-next@vger.kernel.org>; Tue,  2 Jul 2024 06:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719902294; cv=none; b=I+C/ACL70Febb4p3BIgukHy5lp6Od5qKTExr9Qnw/4v/N24HF6msSjQnhO6GgR8UxccqA9EQ1jfIXSsBiaGAMh7WsORVVYeDjPQxdFal/VGjJ5nYA4FnQJ5LnBRG4liSzXwjWGWq2dQXvxxIAmVfYq3iIQym8H3xbzq5VdfriCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719902294; c=relaxed/simple;
	bh=uVGTXrCZ95rXnFyM1jW4IBOOvZ8iiNQ34mCxGz8eJdo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GncXdaDn8bbX+IWS2gUctxcJD5VsaOU8AQrqLmsA5FfyvU7iRRqjSOeNeJOic/M9V9kuHKPzBpG3EqCGBALcAwMRV4iBxfbqo9LqDT2v6uHKXdmLfJlu64fd9Pz15xGzgBO+m0p45JN4wu+ND7Ng3GfEL2sw+QABZFEkn/EaN6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=S2tAOdrD; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-367339bd00aso2911553f8f.3
        for <linux-next@vger.kernel.org>; Mon, 01 Jul 2024 23:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719902289; x=1720507089; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PNCv1zHEy8SjFr6U2erVD2AzxRdRE5SVwR5I879o2aE=;
        b=S2tAOdrDYRoYwhxS3oL/kT+3zSkESMc5YsrOQ13/yjFpeUDvryrP1bjgQ485v6MGoR
         kagPCqwCp7thLejQ6CTrFd2i8Xg/g04VYgQjl1FnoQQjJbg9bvzn3fRvjtC6b2G8/gPP
         CfgWK+2YAarHc16IFHG5LZ1WMeiCh/VfjmewSTLKfpIgiwyGJOaEU9Toho3uwCvb0xfY
         BUsLlCHooCUXAg4X2Gv0yY4ngGg4CPKl3kpkkhzSzlQkKptrJvbgxu0joZdp9oRt2tnk
         jFjrMbBx33XLVvGB2sLEULYXiHzDEsYIHl5tSkJF8WmLhR9LB/ETvfrgVtkZEvhidtCd
         QQaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719902289; x=1720507089;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PNCv1zHEy8SjFr6U2erVD2AzxRdRE5SVwR5I879o2aE=;
        b=j8+RMind0fghJ0ZXiY4El/w40Ys4EfnwkYrEZReQ1pdkzT50BHvzPBm/PN++r0YHUm
         DLixC4TKIJyUNx/9ILsVvg0+2gwneHhrLzC8l1Sv8xPi5tNF8U33mNW+DbqvFq2/C/Zv
         /MVLdlamcSRmOlTE5uvxEKLoBdGWeto05/l7DdgmuiNq6J6vFU4vA2FIfFoFpq7LTWZ+
         SL3NxvfZEdnS9NfDoADa0ulGrvdb1DSWMVPPJpRxPqObDbn7eSnBuCN6xqBHZncV+C6k
         OTpX5fuWY62xg6IlN0gw7YUWNoDVgP06LnEVtcmVvoxSU6QW7o9Lm3Mn1OS2QXUZ1dBq
         xxeA==
X-Forwarded-Encrypted: i=1; AJvYcCUpTfLlTjxlNicTlzNZnpLorAxXpgDzOELZ5hLXuFlhs0DMiQFhD7CQ+2kugyzCqkLKI/zsrAFfJhxCE9lpcd6d32YKF4ErWQ6cjQ==
X-Gm-Message-State: AOJu0YxLwf0Dg9SXB1bKmF9iaXSeXkkftKsW6zLsjdJTOUYY5A7OUtQt
	3bqPSJlHzVe7LAxNPESJ7MIqt7qrJ21l9vk+dc4qdykgkv8QJjmTOAB9JxkDdPOWEwfb8GuWvhN
	GyQqOQZ/ytBYLdQ4oYTQGHcRUyP/CfC990RMI
X-Google-Smtp-Source: AGHT+IHFFIpP0I+ybtmWQvASLb2wmgzFLFQ4KKDZRXguJSPBoitxkQ1JFanEaFATLkfV3ZeHp5H9vkHujV1yOOdWuF8=
X-Received: by 2002:a5d:58c3:0:b0:367:8147:92af with SMTP id
 ffacd0b85a97d-367814793femr695746f8f.69.1719902289308; Mon, 01 Jul 2024
 23:38:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240701184912.01f1f9ce@canb.auug.org.au> <20240701201448.7878e9b35e1569bfc1f2ddbc@linux-foundation.org>
 <CACw3F52=GxTCDw-PqFh3-GDM-fo3GbhGdu0hedxYXOTT4TQSTg@mail.gmail.com>
 <CACw3F52wm=5Rg+QP-E7JDOjBvA2mYv0uDBL+8=KPCfQ8tkHQaA@mail.gmail.com> <20240701231826.fb3044bb52dc97bedc9853ab@linux-foundation.org>
In-Reply-To: <20240701231826.fb3044bb52dc97bedc9853ab@linux-foundation.org>
From: Jiaqi Yan <jiaqiyan@google.com>
Date: Mon, 1 Jul 2024 23:37:55 -0700
Message-ID: <CACw3F52_obAB742XeDRNun4BHBYtrxtbvp5NkUincXdaob0j1g@mail.gmail.com>
Subject: Re: linux-next: build warnings after merge of the mm tree
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 1, 2024 at 11:18=E2=80=AFPM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Mon, 1 Jul 2024 21:33:20 -0700 Jiaqi Yan <jiaqiyan@google.com> wrote:
>
> > > > This seems a reasonable thing to do so there's probably some way in
> > > > which to do it, but a bit of grepping failed to turn up examples in
> > > > existing .rst files.  Can someone please suggest?
> > >
> > > It seems I need to add some blank lines according to [1], especially
> > > to add a blank line above the first list item:
> > >
> > > diff --git a/Documentation/admin-guide/sysctl/vm.rst
> > > b/Documentation/admin-guide/sysctl/vm.rst
> > > index 75e22137d849..74b4c0f65213 100644
> > > --- a/Documentation/admin-guide/sysctl/vm.rst
> > > +++ b/Documentation/admin-guide/sysctl/vm.rst
> > > @@ -274,12 +274,15 @@ Correctable memory errors are very common on
> > > servers. Soft-offline is kernel's
> > >  solution for memory pages having (excessive) corrected memory errors=
.
> > >
> > >  For different types of page, soft-offline has different behaviors / =
costs.
> > > +
> > >  - For a raw error page, soft-offline migrates the in-use page's cont=
ent to
> > >    a new raw page.
> > > +
> > >  - For a page that is part of a transparent hugepage, soft-offline sp=
lits the
> > >    transparent hugepage into raw pages, then migrates only the raw er=
ror page.
> > >    As a result, user is transparently backed by 1 less hugepage, impa=
cting
> > >    memory access performance.
> > > +
> > >  - For a page that is part of a HugeTLB hugepage, soft-offline first =
migrates
> > >    the entire HugeTLB hugepage, during which a free hugepage will be =
consumed
> > >    as migration target.  Then the original hugepage is dissolved into=
 raw
> > >
> > > But I am having trouble testing the build, so wasn't able to validate
> > > the change above:
> > >
> > > Documentation$ make
> > > /tools/net/ynl/ynl-gen-rst.py -o
> > > /Documentation/networking/netlink_spec/index.rst -x
> > > make: /tools/net/ynl/ynl-gen-rst.py: No such file or directory
> > > make: *** [Makefile:113:
> > > /Documentation/networking/netlink_spec/index.rst] Error 127
>
> You need to install all sorts of whacky system and python packages.
> The (failed) build process should guide you through this.
>
> > I tried another way: make htmldocs at repo's root directory. Although
> > I wasn't able to finish the make process,
> >
> > - without the blank lines:
> >
> >   Documentation/admin-guide/sysctl/vm.rst:278: ERROR: Unexpected indent=
ation.
> >   Documentation/admin-guide/sysctl/vm.rst:279: WARNING: Block quote
> > ends without a blank line; unexpected unindent.
> >
> > - with the blank lines added, the ERROR and WARNING in vm/rst are gone.
> >
> > Andrew and Stephen, what is the best way to post the fix for this?
> > Should I send out a v8 of the patch with the blank lines added? or a
> > standalone commit for this fix?
>
> I added your fix, thanks.

Ah, sorry Andrew, I should sent out this diff, as there are more blank
lines needed:

diff --git a/Documentation/admin-guide/sysctl/vm.rst
b/Documentation/admin-guide/sysctl/vm.rst
index 75e22137d849..f48eaa98d22d 100644
--- a/Documentation/admin-guide/sysctl/vm.rst
+++ b/Documentation/admin-guide/sysctl/vm.rst
@@ -274,12 +274,15 @@ Correctable memory errors are very common on
servers. Soft-offline is kernel's
 solution for memory pages having (excessive) corrected memory errors.

 For different types of page, soft-offline has different behaviors / costs.
+
 - For a raw error page, soft-offline migrates the in-use page's content to
   a new raw page.
+
 - For a page that is part of a transparent hugepage, soft-offline splits t=
he
   transparent hugepage into raw pages, then migrates only the raw error pa=
ge.
   As a result, user is transparently backed by 1 less hugepage, impacting
   memory access performance.
+
 - For a page that is part of a HugeTLB hugepage, soft-offline first migrat=
es
   the entire HugeTLB hugepage, during which a free hugepage will be consum=
ed
   as migration target.  Then the original hugepage is dissolved into raw
@@ -296,8 +299,11 @@ the request to soft offline the pages.  Its
default value is 1.

 It is worth mentioning that after setting enable_soft_offline to 0, the
 following requests to soft offline pages will not be performed:
+
 - Request to soft offline pages from RAS Correctable Errors Collector.
+
 - On ARM, the request to soft offline pages from GHES driver.
+
 - On PARISC, the request to soft offline pages from Page Deallocation Tabl=
e.

 extfrag_threshold

