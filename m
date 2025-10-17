Return-Path: <linux-next+bounces-8610-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B05FBE7277
	for <lists+linux-next@lfdr.de>; Fri, 17 Oct 2025 10:26:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B4A4188B5FD
	for <lists+linux-next@lfdr.de>; Fri, 17 Oct 2025 08:27:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3760C283C8E;
	Fri, 17 Oct 2025 08:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H/uhB7VI"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5C52773F8;
	Fri, 17 Oct 2025 08:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760689606; cv=none; b=U6j/F5PcyX+Mzv33YB+gTH6aEp0iiLz4hEiKM+LA3gbyj4j2n6hUTytXdb29ztJMsYRAeOrlBSiIlFSVGEFlHJqK0wIETHc8fJaTODH1t8JvEaMOT71H41VKkyyyV5pBXbYEm5ZKI0TOYaiGM2ndjIMy+Wa77kRUUYTNek8O3Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760689606; c=relaxed/simple;
	bh=GGjC84a9qDQZMs3DMPqc/chM6D8uJZ3GcUhGkjXNihw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kYF8p3Ba1rLr132VxMRb732nWDxpAxtsB+sIIPR5ItXe+Sy8naY+sJAD0k3LUxHklKEHWLI7FVNDtJM42+frcS9f0CmssQ37dZAoYVRBQZbcL2ZkO2MsNUNpq66iKDIFsw8vDegxmpyxNMBaeQyQl6h9qwVMnhFIDYHsDcFy8Sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H/uhB7VI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 728E9C4CEE7;
	Fri, 17 Oct 2025 08:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760689605;
	bh=GGjC84a9qDQZMs3DMPqc/chM6D8uJZ3GcUhGkjXNihw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=H/uhB7VIMtBoAVlmWh9ipMEOMcDZN9zdlqq2+U6PWbkNu+/oPbPk4GwczTGEgyZHi
	 OwXYgrIf44caTgCbw7s2q9JV20mmT8/2V8+n+oXxrGxom3QKYMirSwSoKZrRBAcLIr
	 emzUoZU/jXxGNM2pisrhZIrVf2earNg69wOaJjLkVw+ZHwTacs8qCmiMSvZ5MHrZY3
	 oU5F1Y6GG/0yp2aJP8J6B7Aow+i7FdCVs5kz2l72ZnDBQziTFVCDelSc3npGfykzFd
	 NyEm9qc31Wdj4iwSFi/ALA3YGF0nAqKmyO5CrDIEebwfjid2YLGa+MuXe/cjBN/0Ua
	 NMBkhda0gooJg==
Date: Fri, 17 Oct 2025 05:26:36 -0300
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Randy Dunlap <rdunlap@infradead.org>, Linux Documentation
 <linux-doc@vger.kernel.org>, linux-next@vger.kernel.org, broonie@kernel.org
Subject: Re: docs build problems
Message-ID: <20251017052636.0e5bf26d@sal.lan>
In-Reply-To: <87bjm64l4f.fsf@trenco.lwn.net>
References: <c9e9134c-97a2-405a-918d-41aafdd92fa1@infradead.org>
	<87sefj7tom.fsf@trenco.lwn.net>
	<20251015184416.4340e8f2@sal.lan>
	<87jz0v7rxe.fsf@trenco.lwn.net>
	<20251016062322.2fcd6780@sal.lan>
	<87bjm64l4f.fsf@trenco.lwn.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Thu, 16 Oct 2025 15:01:04 -0600
Jonathan Corbet <corbet@lwn.net> escreveu:

> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:
> 
> > Looking at my docs pending stuff, the only thing missing is this
> > series:
> >
> > 	https://lore.kernel.org/linux-doc/cover.1759329363.git.mchehab+huawei@kernel.org/
> >
> > I double-checked: it applies cleanly on the top of docs-next, as it is
> > unrelated to build wrapper.  
> 
> In that posting, you said you weren't sure how you wanted it merged, so
> I have it just sitting in a folder.  I take it you think I should pick
> it up?

Maybe the best would be to have it on a separate branch
on the top of 6.18-rc1 and have it merged to both docs and media.

This way, we'll doc build issues and prevent changes on media docs
to break things.

What do you think?

Regards,
Mauro

