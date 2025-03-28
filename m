Return-Path: <linux-next+bounces-6069-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B633A74C3E
	for <lists+linux-next@lfdr.de>; Fri, 28 Mar 2025 15:17:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D09CE16A616
	for <lists+linux-next@lfdr.de>; Fri, 28 Mar 2025 14:17:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BE992CA8;
	Fri, 28 Mar 2025 14:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SX/izVvf"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E0620DF4;
	Fri, 28 Mar 2025 14:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743171419; cv=none; b=fevd75+JH0W6opEgpS4pzN8bNwYsKxmjroqcszPlCFLjnvKenC5hAQm0NxIvPkXPvvuWeQm8Vn3CgoVKMfzsHdF4NBzBQrHSkqSmUydKSsavXrzfY/Vzqzk4jtPx0ZExjX/FgmTi0FHoObmO86bfVtIR8JsamZvASdIAMu0RUvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743171419; c=relaxed/simple;
	bh=Cvq+aP8CrYzZIA8tAfX7n75QN/jF4x2zO2RFtICsCi4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B5Em9YCvRSBec5jBftRCdnToMLddFhEuSs5ZF18P8DuTwqBFUnf3dM9UnGidNyFKJygXbYu0V7Z5fliE643y+3tU+9hQfmXDWDoNSMaNbblN7n1+fkd3LGUxsioY0l4T6zrliEkDuw8dHKgU1C2Bz7NQewe6uiCW3XE5qDe46g0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SX/izVvf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21B46C4CEE4;
	Fri, 28 Mar 2025 14:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743171418;
	bh=Cvq+aP8CrYzZIA8tAfX7n75QN/jF4x2zO2RFtICsCi4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SX/izVvfQniT9WQGaYVM21JfTy06DcSj86eckxScDfPCjNxrIdZgu/eQUSMkKDcOf
	 nycCyRQqfTQhnTXAM/vbmxQn6n6YJYbj1F8W8hBZNp+Turzm9izUqOPc875vGPBykx
	 HnVeY7ctzJbdOlI2Y+EeCfC0Dj+a4zySdmsiHIgqJpcho2HunILqAmBSW6cu6ez6L+
	 u9JK7os3hh7+LzkHR0dnmK18BwrysT4R6k6j1VZfkP0d/2/5mMDetKS1bSzP/dfA+9
	 p9nmYInyZtxE5VX13/uCemo9Z//xrgPba/nf4nCSNmHxV5MXCrnsrUNl8k46SqM4f+
	 OV+fJ+0oR0Wug==
Date: Fri, 28 Mar 2025 15:16:52 +0100
From: Joel Granados <joel.granados@kernel.org>
To: Ingo Molnar <mingo@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Peter Zijlstra <peterz@infradead.org>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Christian Borntraeger <borntraeger@de.ibm.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the tip tree with the s390 tree
Message-ID: <iphp537xgykfuzwwf2faatglwjh4eejanaucle4f4ew3kmfp2i@23qaverl34ak>
References: <20250319155410.3cdf01cb@canb.auug.org.au>
 <Z9sgFGya_MDbfSQ6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z9sgFGya_MDbfSQ6@gmail.com>

On Wed, Mar 19, 2025 at 08:50:44PM +0100, Ingo Molnar wrote:
> 
> * Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> 
> > Hi all,
> > 
> > Today's linux-next merge of the tip tree got a conflict in:
> > 
> >   kernel/sysctl.c
> > 
> > between commit:
> > 
> >   20de8f8d3178 ("s390: Move s390 sysctls into their own file under arch/s390")
> > 
> > from the s390 tree and commit:
> > 
> >   c305a4e98378 ("x86: Move sysctls into arch/x86")
> > 
> > from the tip tree.
> > 
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
> 
> Thank you Stephen!
Indeed. Thanks!!!

Just a quick comment on this conflict:
1. The conflict is caused because "acpi_video_flags" is after
   "spin_retry" in the kern_table array. The solution (Which I see in
   next-20250328) is to remove them both from kernel/sysctl.c

2. This is the exact reason why we are moving these out of
   kernel/sysctl.c. It is too easy to touch the same region even if they
   are from different architectures.

Best

-- 

Joel Granados

