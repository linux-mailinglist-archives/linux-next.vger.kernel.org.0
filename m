Return-Path: <linux-next+bounces-5617-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DF26BA49CBE
	for <lists+linux-next@lfdr.de>; Fri, 28 Feb 2025 16:05:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B87F83A776C
	for <lists+linux-next@lfdr.de>; Fri, 28 Feb 2025 15:05:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0746B1EF367;
	Fri, 28 Feb 2025 15:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="czff4ECK"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E741126AF5;
	Fri, 28 Feb 2025 15:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740755139; cv=none; b=U+jHSX2vuNeBGJcULHJMDX61oESBUpLUQqzzACheWQWZEYIUeM/hIHy2QTS5521NFXUAEOpX6+iVhVRJTQcztjNuFCCcmudb3pdAwId7hMxZs+U0mB8dRo4BfzWKvIwM9GXglh1rt7jN9TLRLLefk5oidHIn5UAjMQacmzaLPf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740755139; c=relaxed/simple;
	bh=dDhLaUTQsnexKqrrFNWj5eiaDBUeDIExxD57vdbnIUk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l4wKaqmTSUOgAQ8qx4jo8F4k09YlXxVJGEZjw3WmDDWIAF6nH3eppBlJkA0r+564ePMOsuFR8f/m1cwBZomXIe3mI0GVPWnc4crlwIeDZyTaxH/09npMWUj0xSmYjFsckCyWWUwfV7H1z3y44pLNN9vlHh1satrLrS+fH/WWGL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=czff4ECK; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 6ACDC40E01AE;
	Fri, 28 Feb 2025 15:05:33 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id Viqbh_DcTgBT; Fri, 28 Feb 2025 15:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1740755130; bh=nOayeHghCAqB2DpYbyw8dn1Tm6/+M1qiE1LsH7EuhEo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=czff4ECK0f+EZogWoEgxklwtPfGC5XbzuIbsSv/pMnx6yex1nPJGKr8X6kfa9c2T9
	 EZElz3yfcjMsksc+nG4ni8RiurToUaXJzq5DgrHxHXBxoLagQGiE2+C3tG8j34XqgO
	 eOP5VEnI5WFpXNOcBibuULRfG27UpyHS4YsTXDXDnw9lPGEFQWPFZ3dPJdvN/vWoz+
	 y8vVi37zbyG8BJRH2z8IMjMoKLbx6+cV/NQr+6R3D1zEOdZg6QfhIaWttVPdPgt+jA
	 V2bdd9aUIETLbdxDn6L/9twH1z1wD9pXbmlzF4lTNvZz5xGLmnuODg0I3zFGDVgzv2
	 zRXqPRdfwQ9uylxY7YO4TC3c98rgwmG4SqrBY90txC8sy3w+MWuKxSgW2Qp01iarTn
	 Hp5UQMxWMnuGuLstPJDCZQIsN5tH5C5lMwQcZxBjxypkVJ9H/08nOazlfGJGXdfoTF
	 OX7ibwfxb9yiTUdjwdmBCwwWawNAE0nIs1vjA/UzOTr1Q/wquBt1vjp7PNF5QdEAIf
	 uOhIGU4WtdfeR1GWj5DYuySVYdHLAMg7cbxqKrYlco/FRv0a/BXBG8rHWeOmM72VIw
	 xfIZ9bHirxrO1YHaBtDBSvYajCc6g9/NjPwhBq9uB5coWP2KSrNbDOx/GDCZQv86Bn
	 UBEpIaSZ6xLY9p0zG20tLaKk=
Received: from zn.tnic (pd95303ce.dip0.t-ipconnect.de [217.83.3.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id CCD1240E015E;
	Fri, 28 Feb 2025 15:05:21 +0000 (UTC)
Date: Fri, 28 Feb 2025 16:05:15 +0100
From: Borislav Petkov <bp@alien8.de>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Shiju Jose <shiju.jose@huawei.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the edac tree
Message-ID: <20250228150515.GEZ8HQq330pnGPZEP3@fat_crate.local>
References: <20250228185102.15842f8b@canb.auug.org.au>
 <af3e1e183b034ea89ed6582a5382e5c3@huawei.com>
 <20250228103559.GAZ8GRj0xj6AKGVLj3@fat_crate.local>
 <87jz9ann75.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87jz9ann75.fsf@trenco.lwn.net>

On Fri, Feb 28, 2025 at 07:44:30AM -0700, Jonathan Corbet wrote:
> That will solve the problem for now, though that file is kind of a
> dumping ground.  I'll clearly have to get back to my project of better
> organizing the device docs...

If you have an idea for a final resting ground for this one, let us know and
we'll put it there and thus start the conversion.

:-)

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

