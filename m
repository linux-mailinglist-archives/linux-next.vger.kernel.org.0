Return-Path: <linux-next+bounces-4610-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 82ECF9BBCF3
	for <lists+linux-next@lfdr.de>; Mon,  4 Nov 2024 19:11:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1CF9AB23116
	for <lists+linux-next@lfdr.de>; Mon,  4 Nov 2024 18:11:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DD851C9ED1;
	Mon,  4 Nov 2024 18:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GoAXcQvP"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61FA179958;
	Mon,  4 Nov 2024 18:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730743872; cv=none; b=hmpFqjH+eNxc3JH2RSkcwValnMeAmDT/1bD4coui9Z1PU2y8OY5pVL4Y8k1I2EFTf23vj/AaIb3QDvPusrLI/P5qPduM5ReZNnSvE10yOaIHwhSwwK7Tet2Y96ynffUYQdVB31RDa2YdzL/kwfrUZHoypBJNM7QAUeWGI5zdPLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730743872; c=relaxed/simple;
	bh=HpXkPm9qvdf59T8q9QZvC5hh7+fSw6dkLREN82WrOhc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CpSn+fj1OZj2UQKNIHf5sKolh2wVhJCaSsMEFh1oUj20VYNzBaGTgBq71eHKhOuZgpnGfVSwfOI9LV/Xz2KAZIwdiAP7A/tQFgYHX/Q7hOpKkS1bcO4E0ctlUmE/MWbgfduOos6VK5oc3qkrMvB+DDNQNgLMzdpLKSBcXBCY4us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GoAXcQvP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E828C4CECE;
	Mon,  4 Nov 2024 18:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730743871;
	bh=HpXkPm9qvdf59T8q9QZvC5hh7+fSw6dkLREN82WrOhc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GoAXcQvPE7wr8e6IuVwJ/ualDULnPM1gpz8wG/Yp+JuTxbeG5Dj8Cjoot1xwhyM6c
	 A3v8jalXmjHm1XHQItiFSBylWd5TopK7nKhtzLws/gh857Sd9eS4wnmSWiiifCLcxQ
	 ap/4qkALS/uU4L0m7hda1HiJZ/IrIRyzzKeaoywQFLdCzdxLMgYT14ftyq0H54meh+
	 6qFlxciJLqZtnofvOODREF7Gz3Z3rzqBlzm8aTXvAXL3ayMXRNr42sU2t8wkdNL/Hj
	 jq2+pzI+1wJ1kZKa3q/5ujN1LD1WeSMxaOj0vYDJX4VkBdv1FG3RXoEYQRjX5PJkeT
	 1u8Yfj5qXVgzQ==
Date: Mon, 4 Nov 2024 10:11:09 -0800
From: Namhyung Kim <namhyung@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>, jslaby@suse.cz,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the perf tree with Linus' tree
Message-ID: <ZykOPecMKbqirUZV@google.com>
References: <20241101103345.45340b53@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241101103345.45340b53@canb.auug.org.au>

Hello,

On Fri, Nov 01, 2024 at 10:33:45AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the perf tree got a conflict in:
> 
>   tools/perf/util/syscalltbl.c
> 
> between commit:
> 
>   5d35634ecc2d ("perf trace: Fix non-listed archs in the syscalltbl routines")
> 
> from Linus' tree and commit:
> 
>   8c0d1202bad3 ("perf, riscv: Wire up perf trace support for RISC-V")
> 
> from the perf tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thanks for reporting this.  I expected the conflict when I applied the
RISC-V change and now I've merged the perf-tools branch into the
perf-tools-next with the resolution like yours.  So it won't hit the
mainline tree.

Thanks,
Namhyung

