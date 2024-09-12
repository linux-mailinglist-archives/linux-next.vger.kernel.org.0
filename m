Return-Path: <linux-next+bounces-3787-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 000BA9766A5
	for <lists+linux-next@lfdr.de>; Thu, 12 Sep 2024 12:23:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB64D2817F2
	for <lists+linux-next@lfdr.de>; Thu, 12 Sep 2024 10:23:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 630B719F139;
	Thu, 12 Sep 2024 10:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bZCtjb/F"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C74B19E96F;
	Thu, 12 Sep 2024 10:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726136624; cv=none; b=WEPU2vI2jD+jGp1lhkI1cuOsePjUSsuJRptA7Sp8F4/S6V9QgIDeM2BHLHBr5jigRByuB9uSjGNA+dvyK5QVL8LdfbVkyALATY7zaPyJFsAAatbvUk1VyJ9lXVvLobJAOlon7MOmJVYZmRf4H6dWBp8kt4fITlSBX48bskGtVyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726136624; c=relaxed/simple;
	bh=G4mH4NtV/RAYy1pawBvGQ+g7XNqnzarU7DdUksnwiKc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IPx6tIDoWJV2aHHuCTTQb+mOzvJxgr/IU2ulSSGWO5eZFJv9rTCz9tLnjkKVe8BMFEcreoBWNpEBoxsk2+3EImwP7dnApzPASdP/tGTR3q66hGa2G2Ba5ty2eucW2cjD+nR24fIek58rOVF8mPkt6JkBjahsNuA7DA20Tt59DrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bZCtjb/F; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 076DCC4CEC3;
	Thu, 12 Sep 2024 10:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726136623;
	bh=G4mH4NtV/RAYy1pawBvGQ+g7XNqnzarU7DdUksnwiKc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bZCtjb/Fl9BfCnCJdFhnvo5LLPvj2nj5ACeG1968yAFkl0IX6YGDtoakeV2V+Zx50
	 uVoYquxmAxMZydd259MtbzGhSuDNhslD3qLmGTYddN8VmjMe0eUXscxmhpx4DOOzd5
	 N/iguw7s5P9sVo5j83SCxrgign8JRQ2CxvzJMPBQWnhSR1Bbu6dzkLDIamv8k5rxKm
	 vYZ5XxEudCadw8ZLq2g2qB/29C+PI8oqyMtWPcqn6hUHMPKKn+LW3BlZS5ur1qf11S
	 5ITH3qJ67g58TKvTijc4Nb95POdCddReCgHfIP3Wg3E4N9TUBvg2qGizVM6gtGExo4
	 G1TYFoJz/Q65A==
Date: Thu, 12 Sep 2024 12:23:35 +0200
From: Christian Brauner <brauner@kernel.org>
To: Stephen Rothwell <sfr@rothwell.id.au>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Aleksa Sarai <cyphar@cyphar.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the vfs-brauner tree
Message-ID: <20240912-schund-hofft-e935401be71a@brauner>
References: <20240903092745.370fc0c6@canb.auug.org.au>
 <20240903.020556-bouncing.saws.daring.donor-5KuFrSsG4K2W@cyphar.com>
 <20240905105809.6585eec2@canb.auug.org.au>
 <20240910102332.4f171bde@canb.auug.org.au>
 <20240910-donnerstag-feucht-2e1aaf9ae8af@brauner>
 <20240910211236.3110457a@oak>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240910211236.3110457a@oak>

On Tue, Sep 10, 2024 at 09:12:36PM GMT, Stephen Rothwell wrote:
> Hi Christian,
> 
> On Tue, 10 Sep 2024 10:50:39 +0200 Christian Brauner <brauner@kernel.org> wrote:
> >
> > That's weird as I removed everything that touches tools/ from that
> > commit as the tools/ repository is updated after uapi changes
> > separately. That's what I've been told multiple times. I can add this
> > change but it feels odd.
> 
> I did not notice the removal, sorry.
> 
> Tomorrow I will try without the patch.  I guess my fix patch will
> apply correctly even without the actual commits that caused the build
> failure.

Stephen, did you see any build failures after this? If so I would need
to fold down your fix or at least mention it to Linus.

