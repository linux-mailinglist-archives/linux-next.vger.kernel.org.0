Return-Path: <linux-next+bounces-6798-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9D6AB871B
	for <lists+linux-next@lfdr.de>; Thu, 15 May 2025 14:57:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D056F7B0C08
	for <lists+linux-next@lfdr.de>; Thu, 15 May 2025 12:56:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14DBB298C10;
	Thu, 15 May 2025 12:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bk8AiuVL"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD05E298253;
	Thu, 15 May 2025 12:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747313832; cv=none; b=i/e6sIUficU7RS55YauPJf2GFFSyIQRTQIoTWVsm/WIC8zIUfOBl870VZ8DZVmclrjUiEAW/agIG+M+6sffa8jGyM06VBmq9vpsaI57JUQT69evAoLdQJTe37jWH2kgfX4RSdYiom8KiUuUcYAMeHYYH3ajS5adEPRQwlBLdZ9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747313832; c=relaxed/simple;
	bh=fVLeIiShoZEc+SqiPjggCktfijxjcJLo864O5Nu5zfA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fukn17E7utMOCZ8WkIADPI4tfso9OmY5JuE2OqAIdKNeovoN51RUhtnuLdX/5MvPnZTgTikNKNQppShUXqcrqD1wP4Ya5r36Ly6932/I0roZGSWR2LPwBMKeiH9iyOyv+QYbUGs3fQJAvEHDyHk7jN31bNbxIIduYNJQLQLyvWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bk8AiuVL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93EB1C4CEE7;
	Thu, 15 May 2025 12:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747313831;
	bh=fVLeIiShoZEc+SqiPjggCktfijxjcJLo864O5Nu5zfA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bk8AiuVLhEvg+nPmjMTIabWgdtDwvh7KdDxmgj6r7wEHzI6S9QvodH0QwoQSLHRno
	 reMmeVD9wni2TPkkApOyvuOENFR6k/o9wGnGvF+6y2jTsR1MukhZFd4q+MUE1zVc0/
	 eoNZCkT3KaZqVV7VuYj6eSc7+o982ecTnePCa/17jdOjGs8rkUYrvx5T29j83IM9e0
	 zaSGlqQWyQjDIE49Vwny/LfqiiIFYoYocl0al4/Wsfn+GMJhfEu2xCKxaRs/j2Qmbm
	 mZSUNprN/Zbjjp/be8vYjmG60ifyZ1K+hDI0X5kHBbexOvNJuXu2BOypNMvZcUpgVF
	 6Y48HnhqcWdRg==
Date: Thu, 15 May 2025 14:57:05 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	PDx86 ML <platform-driver-x86@vger.kernel.org>,
	Suma Hegde <suma.hegde@amd.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Mark Gross <markgross@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	x86@kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>
Subject: Re: linux-next: build failure after merge of the drivers-x86 tree
Message-ID: <aCXkofMlUGxEmzMN@gmail.com>
References: <20250515164620.071d70e3@canb.auug.org.au>
 <bce51c8f-56c2-3a44-b590-149627398b7a@linux.intel.com>
 <aCWyatvDQEG5l6NV@gmail.com>
 <20250515221929.3d646dab@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515221929.3d646dab@canb.auug.org.au>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Ingo,
> 
> On Thu, 15 May 2025 11:22:50 +0200 Ingo Molnar <mingo@kernel.org> wrote:
> >
> > I'm not sure that's needed, the above build failure is not really a 
> > build failure caused by the platform-drivers-x86.git tree, it is a 
> > semantic merge conflict that should be resolved at the linux-next level 
> > I think. (And which conflict should be mentioned to Linus by whoever 
> > sends their tree second.)
> > 
> > Stephen, could you apply the patch below perhaps?
> 
> Thanks for the fix.  Applied from tomorrow.

Thank you Stephen!!

	Ingo

