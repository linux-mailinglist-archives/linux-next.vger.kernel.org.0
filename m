Return-Path: <linux-next+bounces-7310-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8042EAF60CA
	for <lists+linux-next@lfdr.de>; Wed,  2 Jul 2025 20:06:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EB50B4E5F30
	for <lists+linux-next@lfdr.de>; Wed,  2 Jul 2025 18:06:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CD552E7BA0;
	Wed,  2 Jul 2025 18:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="uAjGgv/8"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F9D253351;
	Wed,  2 Jul 2025 18:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751479602; cv=none; b=YJPNaZAwT1XQR9xT4yX4QbPh1hRm13qNcNTCtk/oD6pa6FMxLjLkXGwoUK0Vd3Syfu1z7yJVZgPFJipIo9Ei+VaiTRg1NdBWK1fjfnfbbUihjaDz432Li/bXY3uWfIvEqXdL1Ooq0qMBxlEQ8IB+L21Xr/iwgvBvzY7kqwnjSsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751479602; c=relaxed/simple;
	bh=I8lbLq6GWeRyrYkx2z+KWZ6cgWMubgfQhduwdBeUygA=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=u5HsJdSDViYF3TWL5Qf71BXi1/tiXc0j2ZsvDR6jsNAukXPHH3538fHhonAWSYxSPV7mVwuOa9f5f8cRCNnRc+0NyUxrmKbby9RtUFONYKtwjfOzhDMOfMkIIBQaby5GoLBEapaiwhK5iAaNxRCnClhJD/kXaa7+tEzfiNVSJeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=uAjGgv/8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8410FC4CEE7;
	Wed,  2 Jul 2025 18:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1751479601;
	bh=I8lbLq6GWeRyrYkx2z+KWZ6cgWMubgfQhduwdBeUygA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=uAjGgv/8aiH8xfL3ObZ32s6RwuV5DdiHjvt0Fcx1aifsxrRwKgY4HwErgN9t0Hcoh
	 6DGJ297m9BNa6JTgqq4cF2dJtlRKErc0IONipYfagXBO5FiGFcKxk3tVypor9KrRjM
	 5vu+ULid8X0DaJb3Lsuw7OC++5DcFIiqbaZo6JaE=
Date: Wed, 2 Jul 2025 11:06:41 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Shuah Khan <shuah@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the kselftest tree
Message-Id: <20250702110641.e7576f500d8ca0149ea444c2@linux-foundation.org>
In-Reply-To: <1181af84-d66d-4ee1-810d-4bd697912b80@linuxfoundation.org>
References: <20250702163622.12bd45dc@canb.auug.org.au>
	<1181af84-d66d-4ee1-810d-4bd697912b80@linuxfoundation.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 2 Jul 2025 09:57:37 -0600 Shuah Khan <skhan@linuxfoundation.org> wrote:

> On 7/2/25 00:36, Stephen Rothwell wrote:
> > Hi all,
> > 
> > The following commit is also in the mm-nonmm-unstable tree as a different
> > commit (but the same patch):
> > 
> >    fd4fadf0da98 ("selftests: ptrace: add set_syscall_info to .gitignore")
> > 
> > This is commit
> > 
> >    1d8c98f3b408 ("selftests: ptrace: add set_syscall_info to .gitignore")
> > 
> > in the mm-nonmm-unstable tree.
> > 
> 
> Thanks - I will go drop it.

Ah, I already dropped it.  Shall restore ;)

