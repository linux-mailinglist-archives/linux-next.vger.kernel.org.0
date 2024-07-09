Return-Path: <linux-next+bounces-2899-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD4B92BEE0
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 17:55:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5D4BB1C21C34
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 15:55:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2810819D892;
	Tue,  9 Jul 2024 15:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kuP0nngX"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37E719D889;
	Tue,  9 Jul 2024 15:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720540531; cv=none; b=D9dB3b+oDYsbSjBe53gXv8VG6iul4ZbXRIAxNt115ul6EzCyL0auROv9W4cVU+LfeftIARhKTUaK32J9bRRuSf//Rbhh6s3gRYd3PWSza3merzW3ClLXRGR4jeWEarioQQdNXiU0VxXOrHsRfzUBsOoBvAyEq6Im79xIMohSRoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720540531; c=relaxed/simple;
	bh=CL8pmg5DFHQd9+ANiwsowCJNRDv1egBuW4RViXT58tw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p1ShtV7AcZj9Crq3O8F+dNRL+eUHJKT21lu4IpbYnniQW9mnJ3fEwEkBYN2HVmLXZKpaA0dvzYVncfEz6XOA6tFJ2ef46D/Ci7nk9L6JfMs2coAE34xA0moUafBwoLrnrPuS6vT5FgxqdQYQ+xaGZoFUOWCGB4J/Iw0HNIBC9oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kuP0nngX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96B0FC3277B;
	Tue,  9 Jul 2024 15:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720540530;
	bh=CL8pmg5DFHQd9+ANiwsowCJNRDv1egBuW4RViXT58tw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kuP0nngXqNYIGo1f/C4nH2zAcXu9AG8DlQhjfmcX6HZI4NMiJTI9NlxCg52FBzyVx
	 KBfiHO0z4MyPcamR/JRKX9TEniT1wHsX12WP2pfKnX3uAHUtIEtGUVb/JSIWscSwi7
	 mdgERbG/mqHCpuu0O3s61DBmPTtYo+yDd1WSVqIJXPaLX2OH18iBEtt1zEBTQAHWss
	 5VoqIf1pBiDJlt5/7S2QMys4sOlasVxgvNrMTpk5lzt9RFYJhgaH+ehAQLi6SUk1RN
	 lpcR6R/ug/SBApr0DL/35tdVqjCnpzXZTUc4dKhTAqpT8gRlmuK/pYgirVlSzl//3r
	 ewd7BeRvmpfXA==
Date: Tue, 9 Jul 2024 08:55:30 -0700
From: Kees Cook <kees@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-next <linux-next@vger.kernel.org>,
	liujinlong <liujinlong@kylinos.cn>,
	liujinlong <mingliu6104@gmail.com>
Subject: Re: linux-next: manual merge of the kspp tree with Linus' tree
Message-ID: <202407090855.2CA07B977F@keescook>
References: <20240709175803.36f8bca6@canb.auug.org.au>
 <df14f286-a00c-493d-9abd-83d42dd6b6b2@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <df14f286-a00c-493d-9abd-83d42dd6b6b2@app.fastmail.com>

On Tue, Jul 09, 2024 at 10:29:19AM +0200, Arnd Bergmann wrote:
> On Tue, Jul 9, 2024, at 09:58, Stephen Rothwell wrote:
> > Hi all,
> >
> > Today's linux-next merge of the kspp tree got a conflict in:
> >
> >   kernel/kallsyms.c
> >
> > between commit:
> >
> >   7e1f4eb9a60d ("kallsyms: rework symbol lookup return codes")
> >
> > from Linus' tree and commit:
> >
> >   21b4564fedad ("sprint_symbol: Replace strcpy with memmove to handle 
> > potential overlap")
> >
> > from the kspp tree.
> >
> > I fixed it up (the former removed the code modified by the latter, so I
> > did that) and can carry the fix as necessary. This is now fixed as far as
> > linux-next is concerned, but any non trivial conflicts should be mentioned
> > to your upstream maintainer when your tree is submitted for merging.
> > You may also want to consider cooperating with the maintainer of the
> > conflicting tree to minimise any particularly complex conflicts.
> 
> Hi Stephen,
> 
> Thanks for pointing this out. It does look like the second
> patch also just tries to address the same warning that I
> fixed in my larger patch.
> 
> Kees, do you want to just drop that patch from your tree?

Yup! Done. Thanks for the larger fix! :)

-- 
Kees Cook

