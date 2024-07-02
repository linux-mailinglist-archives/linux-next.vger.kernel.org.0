Return-Path: <linux-next+bounces-2786-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 29BCF91EDBE
	for <lists+linux-next@lfdr.de>; Tue,  2 Jul 2024 06:15:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 93C9EB23627
	for <lists+linux-next@lfdr.de>; Tue,  2 Jul 2024 04:15:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C510D1DA24;
	Tue,  2 Jul 2024 04:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rt7L4I+i"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E78552030B
	for <linux-next@vger.kernel.org>; Tue,  2 Jul 2024 04:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719893720; cv=none; b=a4R7gX4ipBxcNgtywGWMI3eDjm3eDRezZBCcwukd3MsYmgcy9iBQZK8L3WRsL8i7KUHR/QwlnCYdN06mgR/cs7deE1zkgwACmTQGmIboMYA2r5Zbr3X0+H9SdKqoS32/tc0DqGMVJOZR4kRYMLE3N0x941IdG0lQ34jWpE6m6js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719893720; c=relaxed/simple;
	bh=ZWsNogRVnns5cet+PBja4gLwrx9LY7hMmua3yurU3JM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fQfnxeMC1gTR3xVkQxPxlY5czmAhBuA0t7W22u++4wzmtQt3W31wqkyCir8V9ZOzXqUO09X4k9p27Rae3P3E+otdv5GT9RcgS8wQNqqsLwi8uYZiSE+OFUGPG2RYBzAeBCjQDEiPBbeSiUQ6+KVLl7o8fUAbE5TNM4fYpD+o5C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rt7L4I+i; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-42565697036so27932115e9.1
        for <linux-next@vger.kernel.org>; Mon, 01 Jul 2024 21:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719893717; x=1720498517; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EevALuEQAKTYdIpOrLnzivNt8QLRmSfCy/CDC5aK0TA=;
        b=rt7L4I+i5cmtvgMPqVIboFQV65vRhs1iMvxcIx+ZU+qunZivLHzlyg0lr1XtTlmxLr
         p2hIJLq2VQGxMmgjB3RSUahoyweaHUjX8/u5mtiSq+zq/7FnvI2PKFL/fpfgvRcNzWxl
         88jyKSd1AWLxF/eRXLjN9BwOkyN1Tuc1qMJQWM/kwgJs83BqsWOMCzw4OTWBSMYek5XO
         k2qYuVDVGbnsqyEcQXSl25JacOJlve1sYTPHnphIx62qN6faxweanvIe6eO1XmByx/ir
         Bpuew3Uji9hxPHHa1cHmGM29BkCZbcYflaZpX2hswjdvOt5gLsPI3p4YrMPyBYmef2eS
         xtHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719893717; x=1720498517;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EevALuEQAKTYdIpOrLnzivNt8QLRmSfCy/CDC5aK0TA=;
        b=fI3ee1bORWRyd7Ouf/t8YxYKuB+nnK+5zmU0c7r1pwerbsEr0jReIp0lN2QTwEOOnh
         i5NIleB3qmuHMsct9pAgDG1UYVZfUWfLRf8A/QMsdHON1lZ6GGjW0DwYxSByft2xnDUv
         546DUqdZdfFAftKpiJHKSQbrJ6Jx+ftvAO1eUN06RJiwdDjE+QgPVnt5qTh1nM53BanZ
         nqwDCWdzO9nnWmOPfPogXv/lNGqVmeWvN9+2rnuSvRv7oPNkWlrhePR7jFEGy5OlsTOp
         s/4qX/QzPYXE+JZzLTX0ltjpN5Rk3G9UVpwEtG4lDrcNVaUlnjT2ZQ3/W0s/gc+aA0Wk
         gtNw==
X-Forwarded-Encrypted: i=1; AJvYcCXkQUgWkojCSiYJ+9t1OuZbujEVdY6yRuUsBD8MHBB2i/zXlNlkgbtOcsSeCgclCIJP4WxWLPjPQFaoO7OG8w0yb5BUa6zl9dQh4A==
X-Gm-Message-State: AOJu0YyuMIa74texVTEzIbt2fo3sKM6kWH6JA+W5RJKfIkYfM7qiBBq4
	+SlfpaDkT97s2pv0utiFs/iYvI7K0xciK1XF3SJScJejsgCAKuxx/2dQOfO7E/9zNXxvn+kb8IG
	P7s186jeHwoL5iaKwtCTFTGv7U9/Z/2Ka1roH
X-Google-Smtp-Source: AGHT+IHBcNobxBEs8U0B2IiWSXZ7vTR+8oM61v830nDHqdxeYwUA0Ip4SprAWAT+QBBPSTarwvfJsXsKhnhRNWDVwYI=
X-Received: by 2002:adf:fa82:0:b0:364:4321:271a with SMTP id
 ffacd0b85a97d-36760aa2ea8mr8855849f8f.25.1719893716958; Mon, 01 Jul 2024
 21:15:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240701184912.01f1f9ce@canb.auug.org.au> <20240701201448.7878e9b35e1569bfc1f2ddbc@linux-foundation.org>
In-Reply-To: <20240701201448.7878e9b35e1569bfc1f2ddbc@linux-foundation.org>
From: Jiaqi Yan <jiaqiyan@google.com>
Date: Mon, 1 Jul 2024 21:15:05 -0700
Message-ID: <CACw3F52=GxTCDw-PqFh3-GDM-fo3GbhGdu0hedxYXOTT4TQSTg@mail.gmail.com>
Subject: Re: linux-next: build warnings after merge of the mm tree
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 1, 2024 at 8:15=E2=80=AFPM Andrew Morton <akpm@linux-foundation=
.org> wrote:
>
> On Mon, 1 Jul 2024 18:49:12 +1000 Stephen Rothwell <sfr@canb.auug.org.au>=
 wrote:
>
> > Hi all,
> >
> > After merging the mm tree, today's linux-next build (htmldocs) produced
> > these warnings:
> >
> > Documentation/admin-guide/sysctl/vm.rst:278: ERROR: Unexpected indentat=
ion.
> > Documentation/admin-guide/sysctl/vm.rst:279: WARNING: Block quote ends =
without a blank line; unexpected unindent.
> >
> > Introduced by commit
> >
> >   2cba7831f62c ("docs: mm: add enable_soft_offline sysctl")
>
> Well that's annoying.
>
> @@ -267,6 +268,37 @@ used::
>  These are informational only.  They do not mean that anything is wrong
>  with your system.  To disable them, echo 4 (bit 2) into drop_caches.
>
> +enable_soft_offline
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +Correctable memory errors are very common on servers. Soft-offline is ke=
rnel's
> +solution for memory pages having (excessive) corrected memory errors.
> +
> +For different types of page, soft-offline has different behaviors / cost=
s.
> +- For a raw error page, soft-offline migrates the in-use page's content =
to
> +  a new raw page.
> +- For a page that is part of a transparent hugepage, soft-offline splits=
 the
> +  transparent hugepage into raw pages, then migrates only the raw error =
page.
> +  As a result, user is transparently backed by 1 less hugepage, impactin=
g
> +  memory access performance.
> +- For a page that is part of a HugeTLB hugepage, soft-offline first migr=
ates
> +  the entire HugeTLB hugepage, during which a free hugepage will be cons=
umed
> +  as migration target.  Then the original hugepage is dissolved into raw
> +  pages without compensation, reducing the capacity of the HugeTLB pool =
by 1.
> +
> + ...
>
> This seems a reasonable thing to do so there's probably some way in
> which to do it, but a bit of grepping failed to turn up examples in
> existing .rst files.  Can someone please suggest?

It seems I need to add some blank lines according to [1], especially
to add a blank line above the first list item:

diff --git a/Documentation/admin-guide/sysctl/vm.rst
b/Documentation/admin-guide/sysctl/vm.rst
index 75e22137d849..74b4c0f65213 100644
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

But I am having trouble testing the build, so wasn't able to validate
the change above:

Documentation$ make
/tools/net/ynl/ynl-gen-rst.py -o
/Documentation/networking/netlink_spec/index.rst -x
make: /tools/net/ynl/ynl-gen-rst.py: No such file or directory
make: *** [Makefile:113:
/Documentation/networking/netlink_spec/index.rst] Error 127

[1] https://docutils.sourceforge.io/docs/ref/rst/restructuredtext.html#bull=
et-lists

