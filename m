Return-Path: <linux-next+bounces-6916-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA4AAC20B1
	for <lists+linux-next@lfdr.de>; Fri, 23 May 2025 12:14:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 22C6B189667C
	for <lists+linux-next@lfdr.de>; Fri, 23 May 2025 10:14:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEE7C226CF8;
	Fri, 23 May 2025 10:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JShNWvc1"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6739226CF0;
	Fri, 23 May 2025 10:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747995277; cv=none; b=VEV3NugIOFnhjjQlnkXG5+y00og2z5KluwIRpRvmOOA7VPK+ESnClS6qb9QSbzCwLq/0+Cjd8IEpDf0QFRlkOgwTuxkdfICwfkv6Z/CHs7iFe1Hx+gwsCMHOTAGSjV7TkgAgbKYOFvlHiKElWq2D4oDn3lWWRIAdR9ujv66H/No=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747995277; c=relaxed/simple;
	bh=doXxwD2C+nvQfC+dPSUH9cfU3UwXHtPjyGSIf5QpaJc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U6e0coODJvlEg3MO6daHGmbNUC53mRhLweVFr9gtIUNvbwkfSUDiHbw64/7gc+wJ9OGE+6Mw6f5e2hcwsOFzUnbS2//X4brtXIG/obEtv140XSd7J50GvDvIg9XCsdvSwdlJ5WeuaArX1mv+3WTEnAvHT8PnmG0x77uUVLwWkaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JShNWvc1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3467CC4CEE9;
	Fri, 23 May 2025 10:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747995277;
	bh=doXxwD2C+nvQfC+dPSUH9cfU3UwXHtPjyGSIf5QpaJc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JShNWvc1gQSC9xOdm5LOxS7tubjVaR4PmGFDt8Y0rf6Y3oD7P5ePk1A1li8bEE4Zf
	 sOTuwb/ZbhKoAKT2nAtdORwFPr1nz09GEaYNhSsL3K3Dms2auuxLFeJQCbuzU1pTz9
	 i92BmI2hke6Ox2V95G3AyXmjgQ0aRF4mg13hH0vLuJxtTuHAMz+DMtfbCDJqlaePXo
	 RK04Yre1fS2zp4J5KB+7rX/rSsvB/YE311KXC7+PAZ6rFlrDnoWlwNlcN+6xi4Lmzj
	 G/82FAUCUKs7pp1LIsJ60ykPFYY8msUW2mA6YQLLqQv2ADik+Gr9NWTlJKEolYMin0
	 JHv4oWrRsS4wQ==
Date: Fri, 23 May 2025 12:14:33 +0200
From: Christian Brauner <brauner@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the vfs-brauner tree
Message-ID: <20250523-halbieren-inhaftiert-f9dbef8c379b@brauner>
References: <20250521204923.1e002f04@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250521204923.1e002f04@canb.auug.org.au>

On Wed, May 21, 2025 at 08:49:23PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the vfs-brauner tree, today's linux-next build (x86_84
> allnoconfig) failed like this:
> 
> x86_64-linux-gnu-ld: fs/coredump.o: in function `do_coredump':
> coredump.c:(.text+0x1795): undefined reference to `sock_from_file'
> x86_64-linux-gnu-ld: coredump.c:(.text+0x17a6): undefined reference to `sock_from_file'
> x86_64-linux-gnu-ld: coredump.c:(.text+0x17b3): undefined reference to `kernel_sock_shutdown'
> 
> Caused by commit
> 
>   997e88a74ed6 ("coredump: add coredump socket")
> 
> # CONFIG_NET is not set
> 
> I have applied the following hack for today to make it build.

Thanks, I fixed this a few days ago.

