Return-Path: <linux-next+bounces-4277-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B1099F5F5
	for <lists+linux-next@lfdr.de>; Tue, 15 Oct 2024 20:45:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA47C28260A
	for <lists+linux-next@lfdr.de>; Tue, 15 Oct 2024 18:45:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CA891B6CE9;
	Tue, 15 Oct 2024 18:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NZ6aI76w"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF421B3956;
	Tue, 15 Oct 2024 18:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729017910; cv=none; b=rKu4lnigPdfUig+zij2UcPdltN/7m2XYe52QCy6+xDShXx7o8Vego2YfHeyzIPQQNbrX32gUOJZIKdjloHBcGb/ngDmBxZqcgegEDJl+s9J6c5z8XogCdrRoMM9d/WIdw61b/ziW5rUUEkUWGfqPNs1T8p+dps3Zsu9Ir4S4dbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729017910; c=relaxed/simple;
	bh=xbs456TgjY0hrlLhjQh7hzm9ZsJS4b7VGfk94SrC9g4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PtnlzlQ/01Kohgex0S2mMTbGt1R+CSMkmDatG5HUUNi8hgsDTUkFrUORQl7QK2oRThVz8MEmjqbzmjW3weac5UDLc4i2aEU4LcgqPnHf2apAll0XZOrqSrjnm3jV2Ghm2G+xf8phXIwtEnKVLFBP1yu0rY1GQ5NVkReGrY+WO34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NZ6aI76w; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51997C4CEC6;
	Tue, 15 Oct 2024 18:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729017909;
	bh=xbs456TgjY0hrlLhjQh7hzm9ZsJS4b7VGfk94SrC9g4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NZ6aI76wjHaQiqFptLDHHRevIGDhVOtb0qQsTqFDGch59iK2HmoAiNCV9gZsf6FE6
	 upzTPyNVWEu9VcSp5gEeVyXbr8xWRAoSU1oh+zvg3vxoB9QHXHai1dvNFzWL7TwA3Q
	 ARxc+kb4mAShhkavkAmrrsC3XKxkn7f3W2ESPg6DFZaLw86O9TjPStfhY5P7Yz1apu
	 IEhrVfw4B8JeF6bPagKxBWS9stPTD+ZsFa1Osq26Agaz/mJrT+MwsH/PQVyJAr+7DD
	 jOT7sKEb2mk9YQJHXY/XGqvpxddsOO4Qz3bpDWN5n9+5NCcmm5xG0oNSwkCDh/3rrB
	 TlITODw/kpVPg==
Date: Tue, 15 Oct 2024 13:45:07 -0500
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: dmitry.torokhov@gmail.com, bentiss@kernel.org, sfr@canb.auug.org.au,
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
	linux-toolchains@vger.kernel.org
Subject: Re: [BUG] -next objtool build failure (bisected)
Message-ID: <20241015184507.hiepeqrjgcjssvoj@treble>
References: <fe8c909e-bf02-4466-b3eb-0a4747df32e3@paulmck-laptop>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <fe8c909e-bf02-4466-b3eb-0a4747df32e3@paulmck-laptop>

On Tue, Oct 15, 2024 at 11:10:11AM -0700, Paul E. McKenney wrote:
> Hello!
> 
> The next-20241011 release gets me build errors like the following:
> 
> 	vmlinux.o: warning: objtool: fetch_item() falls through to next function
> 
> Bisection leads me here:
> 
> 	61595012f280 ("HID: simplify code in fetch_item()")
> 
> This diff looks inoffensive to me, but I get this error on this commit
> and not on its predecessor.
> 
> This build failure happens on quite a few different kernel configurations.
> I bisected using this particular reproducer:
> 
> tools/testing/selftests/rcutorture/bin/kvm.sh --allcpus --buildonly --configs SRCU-T

The problem is likely this:

+	default:
+		unreachable();

The unreachable() annotation by itself produces undefined behavior, as
it will just fall off the edge of the function if the default case is
ever executed.

Better to do

	default:
		BUG();

which makes the behavior defined.

-- 
Josh

