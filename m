Return-Path: <linux-next+bounces-8454-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E4BB96DE8
	for <lists+linux-next@lfdr.de>; Tue, 23 Sep 2025 18:45:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 096FF2E7290
	for <lists+linux-next@lfdr.de>; Tue, 23 Sep 2025 16:45:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84CEE3294E2;
	Tue, 23 Sep 2025 16:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jN392ipT"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ACDB328997;
	Tue, 23 Sep 2025 16:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758645903; cv=none; b=X2EhPYVjR0iIX0zB0VmscDfI2oDU1Qioe5bZiPM0yGSQ4stSVerZfWAfRQYLoiIWBsyvjMgeY2juOxaKGXBlsD3BYdL1O4q6CQhC8PYMniB7svDbv/nFKz7qDPOsWOdvqfc8K3DHewhnLTl9+4P7mWR46Z29uyHbZOlpuqAqCmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758645903; c=relaxed/simple;
	bh=90orfWDp6Lv6S0rbGM/MJkBv4+Lqkv7QmnKAwaBbjp0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ssU0GZTYYlUCqxb03ZjC63q7HTf9zNnXi24U4aL2vr3HOuX8Ne/Y5DeJGkVH5n90GcjrrcJcVPiXGKGAz09zjJSeH+7NpldYZxK63RYwSCYyYovHdfsgJEmUwz9yg/I9ISd0C7Z/JofGU0YqU2Q41QqrtWkFh58K7kmYw3LVQDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jN392ipT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63022C113D0;
	Tue, 23 Sep 2025 16:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758645902;
	bh=90orfWDp6Lv6S0rbGM/MJkBv4+Lqkv7QmnKAwaBbjp0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jN392ipTskZumn2/fPXj9HO7U96vRzy1YTNqeSGpSm+dqYQMSTXqNh49n3eGlhGlB
	 IGsfir5Wap/KVszf0YtfwxOqn/ePmvQOoBLnMtmmAS8hgWEsbMO+iDLCxkD5PPzvPK
	 SmN2hwBWXdRIgMUqXAoXOyM4Roaj7DhC9WDP+T5E+ON14QrWLSFrnP2C8NA5xUIklC
	 uBYdeE+h1SkcQ6ZUBguliAPsUpSmgnF0RTOv6gFGCQs5sGjJ0sR3vjxQZMYORVPaHA
	 Rq9VI6U8WORQbr3Zzz2wVdJHd4GOQ16Bks2xQnfSNuMATDi2IDm/aa28dd/ayS6F7O
	 AUbD/7oEUxvHQ==
Date: Tue, 23 Sep 2025 17:44:57 +0100
From: Will Deacon <will@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Christoffer Dall <cdall@cs.columbia.edu>, Marc Zyngier <maz@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the kvm-arm tree
Message-ID: <aNLOiRB_HeUAnFKI@willie-the-truck>
References: <aNK8hSSKKZhEHZbt@finisterre.sirena.org.uk>
 <aNLEem8ryBiqKfDr@willie-the-truck>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aNLEem8ryBiqKfDr@willie-the-truck>

On Tue, Sep 23, 2025 at 05:02:02PM +0100, Will Deacon wrote:
> On Tue, Sep 23, 2025 at 05:28:05PM +0200, Mark Brown wrote:
> > After merging the kvm-arm tree, today's linux-next build (arm64
> > defconfig) failed like this:
> > 
> > In file included from <command-line>:
> > /tmp/next/build/arch/arm64/kvm/at.c: In function 'setup_s1_walk':
> > /tmp/next/build/arch/arm64/kvm/at.c:229:30: error: 'TCR_SH1_MASK' undeclared (first use in this function); did you mean 'TCR_SH0_MASK'?
> >   229 |                    FIELD_GET(TCR_SH1_MASK, tcr) :
> >       |                              ^~~~~~~~~~~~
> 
> [...]
> 
> > Caused by commit
> > 
> >    4f91624778b27 ("arm64/sysreg: Replace TCR_EL1 field macros")
> > 
> > from the arm64 tree.  I have reverted that commit.
> 
> Thanks, I'll drop it from arm64 as well.

(now dropped)

Will

