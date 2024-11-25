Return-Path: <linux-next+bounces-4841-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0629D8B5B
	for <lists+linux-next@lfdr.de>; Mon, 25 Nov 2024 18:33:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 53E03B28CF1
	for <lists+linux-next@lfdr.de>; Mon, 25 Nov 2024 17:26:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CAEA1AC453;
	Mon, 25 Nov 2024 17:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=proton.me header.i=@proton.me header.b="Rn/fq2xM"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 411D51B415F
	for <linux-next@vger.kernel.org>; Mon, 25 Nov 2024 17:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732555575; cv=none; b=TT8NYOSOz8AckgmiDMuOd1f0scuNYydpWLr0drHKNYpK9aNikRiJVKkB73d0KCNOIebu8G6YgoENhgSTQI5iKalRo5B+psIv/OfbPEX7xXDZrF9/KohA70IRsX3/Pjb7C6oAejAJjSuYlqVNXc/BORyb9xleI3U/GajFzcKouoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732555575; c=relaxed/simple;
	bh=8ajswOrGYd3is1g5IE0muUlQKgtOhRHxzooMIZkkH+M=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bx2R6UBGX1y/xzwPD9Am/PSc0xI5ixGeNfGMjUvZM90c53nigG22WGmo2f0qQn4yRhXyQge2W1ZGmCq9j+Hj5m26je4uUb2D5rQJM8T29J73NDSLmvmxRZMRAH9J2mgSQxlbegsT0tDLpFtltELilq2h2tsM/bF/y532ykYy8+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=Rn/fq2xM; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1732555565; x=1732814765;
	bh=8ajswOrGYd3is1g5IE0muUlQKgtOhRHxzooMIZkkH+M=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=Rn/fq2xMimNvOnVKpzDnZiLkBZpIn5SFbsycWwxh9CPkqwctwTJRHBn/AFh/ge4uY
	 lr1BuhI2iuOmwXnRxMlXevVOTm+EGMrxYHwcO4ikD7EtcK0LWTH3gMC2wY4gmOq7Rn
	 Uobr+xPchhV6EWgejTuExWqWOArFDlvHWrh6sJfmwOrSI2FCR+JYlwWyjdrVIxRnUM
	 +wsjybCMmKieIMBsLNY+lWYNC7k3sJI4WVo6+Gve8x7bpEkY6UuS5O2ScN9jj6ggJo
	 4wa41nENiBkUfB4sDuV9j8alO+6RH9BAKT6BESENAk7mI1N2BpJm5bJqOGuHK2uDII
	 0rMQo57775Vig==
Date: Mon, 25 Nov 2024 17:26:03 +0000
To: Stephen Rothwell <sfr@canb.auug.org.au>
From: Piotr Zalewski <pZ010001011111@proton.me>
Cc: Kent Overstreet <kent.overstreet@linux.dev>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the bcachefs tree
Message-ID: <L_EkkmQsB6qOPGXuF9tsZFHbNXMQcco_bdzKzow3ZXhjccVKzQJ-Ekd8SU4Ofqt9RNJccI_ZlUrjsNDGvKZuuujdUjxHcaS6qT8WkmHITL0=@proton.me>
In-Reply-To: <20241124183507.5241d705@canb.auug.org.au>
References: <20241124183507.5241d705@canb.auug.org.au>
Feedback-ID: 53478694:user:proton
X-Pm-Message-ID: 8cef4097f0ea3af5f88a6e7906a5a789c3e8c684
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sunday, November 24th, 2024 at 8:35 AM, Stephen Rothwell <sfr@canb.auug.=
org.au> wrote:

> Hi all,
>=20
> Commit
>=20
> a4f3d037408e ("bcachefs: Fix evacuate_bucket tracepoint")
>=20
> is missing a Signed-off-by from its author.

Looking at the commit - Kent has changed my patch significantly. So either
there was a mistake in assigning myself as an author or he forgot to add
my signed-off-by line.

Regards, Piotr Zalewski

