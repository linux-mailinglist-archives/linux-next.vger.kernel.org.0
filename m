Return-Path: <linux-next+bounces-3705-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D79D59719A2
	for <lists+linux-next@lfdr.de>; Mon,  9 Sep 2024 14:38:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 74737B22021
	for <lists+linux-next@lfdr.de>; Mon,  9 Sep 2024 12:38:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA6751B5804;
	Mon,  9 Sep 2024 12:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qw9+w+qn"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C171B375C;
	Mon,  9 Sep 2024 12:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725885475; cv=none; b=OcyvOh8UD+FypDgdUYbA74DZw4Qwi8/AIP11qOZLDKE2YVEOw4Ns4IZ7xlyt3ZwMbvVjMQCKKoVkCpnbae2GEvI0/hhROkGVxpizPZJ7oi73mM0zoAK/PIa24fjsy2Qr0u1sO9G17xqeUIKSmwL+JGBSCJ7rptSEnUMcZSJqGmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725885475; c=relaxed/simple;
	bh=Ox6Ra08uH73+LfHI4jYwmkiw6hd1NlstdidpzuiK9Ek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LKomOAmynRAweMdBjnFDO9vdyWGob7SDgNGV+dN2MHfy/Zti9vny6liPPwoICtckXep/EnQlEegLrowy3dLt5m1aayJ+uPEu6Sqe1IFaiLArhzncAZhocTZOlDI1nMyJSvDkUBOydNHeq4EmcMv/7D6OXvjzuDUEh2owTorD0a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qw9+w+qn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1033C4CEC5;
	Mon,  9 Sep 2024 12:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725885475;
	bh=Ox6Ra08uH73+LfHI4jYwmkiw6hd1NlstdidpzuiK9Ek=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qw9+w+qn2P+GmP4hQkOwuagekxfeH00ombthTu8tHXs2E+ZB7ueytpfAJoq0O5fmN
	 bIUs3rop593+rUmgoh5eRQTjH6MzcaeWCiV5LLMs8wm6w6orrocowqrG8ZjGxY9pCO
	 1NGNwYu6SGHXCa12/t57HpC7yD2mitiGbBYWxZE/cWMoVEN8jZRFjiMl4QKsmUU4Df
	 kFJ0i7OjVL0LqNA3eF7kPafmG2VCpjFiNNf7LhmrYI54yAZ4Ll1ci2qLxkLP/Tept2
	 DIqrvWJGq9rchJYeLnNmIssEGicK0xoTQDpqfy6tgwtLeSkDGY16WZssfuL7VOpi51
	 O3t/18vlCqCYQ==
Date: Mon, 9 Sep 2024 14:37:50 +0200
From: Christian Brauner <brauner@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Vlastimil Babka <vbabka@suse.cz>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the slab tree
Message-ID: <20240909-armbinde-klaffen-fc59f67b2279@brauner>
References: <20240909171220.32e862e3@canb.auug.org.au>
 <af23f1d3-27de-4591-ab0a-02268ef547a3@suse.cz>
 <20240909-organismus-sattbekommen-06332e10fcd1@brauner>
 <5661a983-9875-4cdb-8bdb-fc83e82f0b58@suse.cz>
 <20240909-anvisiert-weltweit-d3b485680666@brauner>
 <ffdcd6ff-b83a-47f6-bb23-e6baca7a3bc2@suse.cz>
 <20240909-missrede-abverlangen-dfccd1414bb2@brauner>
 <20240909-kratzen-holzweg-c1fd7da1f895@brauner>
 <20240909214533.0f8437ef@canb.auug.org.au>
 <20240909-fahren-ansah-1b49bad59efd@brauner>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240909-fahren-ansah-1b49bad59efd@brauner>

On Mon, Sep 09, 2024 at 02:19:20PM GMT, Christian Brauner wrote:
> On Mon, Sep 09, 2024 at 09:45:33PM GMT, Stephen Rothwell wrote:
> > Hi Christian,
> > 
> > On Mon, 9 Sep 2024 13:02:03 +0200 Christian Brauner <brauner@kernel.org> wrote:
> > >
> > > Ok, how's it looking now?
> > 
> > I just fetched your tree.  The top commit (vfs.all branch) is
> > 
> >   a80a1ee241e7 ("Merge branch 'vfs.procfs' into vfs.all Signed-off-by: Christian Brauner <brauner@kernel.org>")
> > 
> > and commits
> > 
> >   f2b8943e64a8 ("fs: pack struct file")
> >   c0390d541128 ("fs: pack struct file")
> 
> Sorry, I just pushed the fixed version now. Thanks for the patience.

Incidentally, is there a simple command to detect duplicate commits?

