Return-Path: <linux-next+bounces-5948-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4498A6D61D
	for <lists+linux-next@lfdr.de>; Mon, 24 Mar 2025 09:26:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 301AF16E837
	for <lists+linux-next@lfdr.de>; Mon, 24 Mar 2025 08:26:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9C15257453;
	Mon, 24 Mar 2025 08:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SaZCLTVe"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F7DD200CB;
	Mon, 24 Mar 2025 08:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742804777; cv=none; b=g84vywT7vrtv5QohT9R++un0TO/jAVcuiuPc+FI4vkCA8ei9gB6AQUEbuzqxth+UE08DXZp9fWlMiGUNUI9V9OO3QIUXOX/dfnw7mKomkKhPaSJ4Tjv6j9WKi2+Mz01/Sfc3nvaihwU4F3EqNEfmeoexCAWnbxIeBuwD29766s4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742804777; c=relaxed/simple;
	bh=5KKn/lngrvJo8ZWVZFPg3GDOEzL1QSbhEgnF+HGDD84=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HidEDO4TnWDtMubK2rji71IO/xOo1c7DHseYfi262tBajgoP0clWBVcWiQkS8NQmirVPd+3Rhc++Pi/ONkMYYg7Jq6cy+X7atbWf/pGDor1+y10hBt6fhsOVU/QYrTqpdLbGTIL/13v4/yHINMMs7t1ICC34E61mndmGbnqGEY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SaZCLTVe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA7E2C4CEDD;
	Mon, 24 Mar 2025 08:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742804777;
	bh=5KKn/lngrvJo8ZWVZFPg3GDOEzL1QSbhEgnF+HGDD84=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SaZCLTVeQ11+kYzJzkokhjSaGhL/j+PBNXPRVfwOGTG3/EEa7xetH7ZpKF+omNaCq
	 SFwgMae2aj+Wp+AO4+f/JqqJzlYUS2b2UeURoRDLk2d7bIhKjKXY2tV43Wtto855f5
	 858AVuRwZiwVdKvWkCvCafys5maW4J6bdHpTFRK6MAfRfaDVl+kEV8JHTOg7AekWpO
	 Efuy0KC+lsvTAgQCCfF4kpacdLwbnWH3OkZxWzwHxKRRDHLbckZ/xKPOEBwTvuWbar
	 S/n3FghjrFGZn/HOAoYAQ3MZx/Cf9lRzNKhZQT5o6Y2GNpWVSDX0gHrURg42fTIFuh
	 kcktpEKIV+QIg==
Date: Mon, 24 Mar 2025 09:26:12 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Tor Vic <torvic9@mailbox.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: [PATCH] x86/kbuild/64: Test for the availability of the
 -mtune=native compiler flag
Message-ID: <Z-EXJPOJllZWegx_@gmail.com>
References: <20250324172723.49fb0416@canb.auug.org.au>
 <6227FBC4-AF53-4992-9E29-C0D1DCAFA136@zytor.com>
 <20250324174141.7b3c4a70@canb.auug.org.au>
 <Z-EFSKxiqbGPT9CQ@gmail.com>
 <20250324190628.3e8802b6@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250324190628.3e8802b6@canb.auug.org.au>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Ingo,
> 
> On Mon, 24 Mar 2025 08:10:00 +0100 Ingo Molnar <mingo@kernel.org> wrote:
> >
> > Does the patch below fix the bug?
> 
> Yes, it does.  Thanks.
> 
> Tested-by: Stephen Rothwell <sfr@canb.auug.org.au> # build test

Thank you!

	Ingo

