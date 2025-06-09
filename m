Return-Path: <linux-next+bounces-7111-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B7428AD2959
	for <lists+linux-next@lfdr.de>; Tue, 10 Jun 2025 00:23:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A916189043F
	for <lists+linux-next@lfdr.de>; Mon,  9 Jun 2025 22:23:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 973F322126D;
	Mon,  9 Jun 2025 22:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="DG5a2Ye5"
X-Original-To: linux-next@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3326B1E521B;
	Mon,  9 Jun 2025 22:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749507783; cv=none; b=Q0elkajTGwgLvhwC/bcklCcZkaY5yC0zF5NjO4PJ3dRD/eeI6NmfbfPbO+rRvQueF7X4GQf9CfnmbUMWjxAngLs7bLxeeKFaL4dTRR4cDd3Bl1MEibij9Xbm7c3bv6Gkj+ljwxBpT7YW5icTWr71twj0juEa3rER3UFAWhEqJPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749507783; c=relaxed/simple;
	bh=VaUIKhr9K7NDCCL3tVxwzKuCpQ3/ESayhC9+FlDM510=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=a88mbg5CBuE4C4wWcu78h6mJVNgVhw+14n7oaNoG+3vRpWa1lklo29vij8nAFjpTRUlcSBbIKPVZma8Z+LP6vAJxzLa2HDbnlShb+DKf8stoeY4RHcHTJt7g6kfYhJCnPCjeTYVWYthJa0uJxAdz2YPe2087RZuaWx/fGcKyYY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=DG5a2Ye5; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 5285D41AA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1749507781; bh=E91NmzyhKhHUs7IzCQWOajEB1EYNtF10BTHf2NYCdio=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=DG5a2Ye5Tuka2amQYJQXXpIMiCRCP8cfDVin/RFEvPyhzZXBUxGhQtbhDvLMyEcnC
	 DunB3FgYmDxyr6OuJ3nxuFJdu1blLBdt9M5nebk+cP5uo0h7CPK0P1BdWl7uZRzUW9
	 lqwyV6y9YEu6njiFdg9TAgirfi46j76f8E79YQ7i8vDRYBtCWJPO5vq1z7jq0Ulout
	 fpo9vMbkknplEdWMSLyqh13aROCOVX9v2OKXp/oQBJ/u3cG3zQR2qyJ9H7RRV6RA+s
	 x4MXQqzYqVJsiqAPXHCgR3BZaxbhoKUpRrfTAPcxnBXh3ATw8d2wQv94zPFiw184uB
	 n1dZTju3EmOtA==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 5285D41AA1;
	Mon,  9 Jun 2025 22:23:01 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Shouye Liu <shouyeliu@tencent.com>, shouyeliu <shouyeliu@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the jc_docs tree
In-Reply-To: <20250610081759.185e7982@canb.auug.org.au>
References: <20250610081759.185e7982@canb.auug.org.au>
Date: Mon, 09 Jun 2025 16:23:00 -0600
Message-ID: <874iwo8shn.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi all,
>
> Commit
>
>   47cbe79dedbe ("Documentation: amd-pstate:fix minimum performance state label error")
>
> is missing a Signed-off-by from its author.
>
> Actually it looks like 2 different email addresses have been used.

Gee, I must have pushed that tree at least five minutes ago, you
couldn't find this sooner? :)

Shouye, can you send me a version with a matching signoff, please?

Thanks,

jon

