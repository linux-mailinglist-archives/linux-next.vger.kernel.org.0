Return-Path: <linux-next+bounces-9501-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE59CDA07D
	for <lists+linux-next@lfdr.de>; Tue, 23 Dec 2025 18:07:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2D3713023A03
	for <lists+linux-next@lfdr.de>; Tue, 23 Dec 2025 17:07:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8303F346765;
	Tue, 23 Dec 2025 17:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rxGviHsJ"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ABBB345CA1;
	Tue, 23 Dec 2025 17:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766509626; cv=none; b=EQ4Hz8w3T7VCDq10CJr6AI+G6KoqOg/Q80D7iHzxMwHKDwYwFBVCUG6egv35t+Udrk6z7tj5w/vz/JYTHrpevu6JNmr8+togApVxceejYtvLRSsLR7whmqHK9TBEbtH5LufJ/VDZNjChiH0aPsX7KTMsaooMTw/rs2veCmjGnh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766509626; c=relaxed/simple;
	bh=u1YELSzn9k/u6fxeg0gUW+Iv7ez88LmFCYrwu70ztxk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=RIZVcYm3berWLTicKl/ELXvNxvzSO2/nlbB7VBupdHHVYJt7cGgJZAqBNfnpAEFU1sxAODzPnbS2JXDz6OWqMWxqbVo3FmbG85/0CUhr0Zb5C3sGlZNPfbMFsF3X6zsXM4rxcTqmLh54UKoNwSzK58xQB9XPsVok9cEotDMEmVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rxGviHsJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BEC5C116B1;
	Tue, 23 Dec 2025 17:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766509625;
	bh=u1YELSzn9k/u6fxeg0gUW+Iv7ez88LmFCYrwu70ztxk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=rxGviHsJtbB5kN/Gwo5cs9+xjTPkZOOPRza5AmWCnmQqeCRRRidlIbK57BMpapWRC
	 v0K1DP5U1t/gFk77BA0ahj/aJZUPFC0qCAKraJMKLXWexN7Q/CDy2yJ1ov8vCtrC5b
	 N5qTM1+Rbau6BaWWKJe/2YIH6h8AZfKnf5sNYcNdsTto4jxxXQG/V5j5LVsbZcSdOZ
	 nOXQHrpkKY+WyQ/JnwZ6QIanWdOnb1FSTo/DODncJoiyU6lf3zp3Ws/f0briikhdfq
	 058bpfCp9sMwQAkgxaI2s4IQhbnYEkCPeIL0h1/T3IvRdgv/chK90gmZsyJLW0AEyV
	 j94zXc8bajXzg==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, linux-next@vger.kernel.org, 
 Brahmajit Das <listout@listout.xyz>
Cc: cezary.rojewski@intel.com, liam.r.girdwood@linux.intel.com, 
 peter.ujfalusi@linux.intel.com, tiwai@suse.com
In-Reply-To: <20251221185531.6453-1-listout@listout.xyz>
References: <20251221185531.6453-1-listout@listout.xyz>
Subject: Re: [PATCH] ASoC: Intel: avs: replace strcmp with sysfs_streq
Message-Id: <176650962400.445350.17331328109538303145.b4-ty@kernel.org>
Date: Tue, 23 Dec 2025 17:07:04 +0000
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-47773

On Mon, 22 Dec 2025 00:25:31 +0530, Brahmajit Das wrote:
> allmodconfig failes to build with GCC 16 with the following build error
> 
> sound/soc/intel/avs/path.c:137:38: error: ‘strcmp’ reading 1 or more bytes from a region of size 0 [-Werror=stringop-overread]
>   137 |         return id->id == id2->id && !strcmp(id->tplg_name, id2->tplg_name);
>       |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   ‘avs_condpaths_walk’: events 1-3
>   137 |         return id->id == id2->id && !strcmp(id->tplg_name, id2->tplg_name);
>       |                ~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>       |                                  |   |
>       |                                  |   (3) warning happens here
>       |                                  (1) when the condition is evaluated to true
> ......
>   155 |         if (id->id != path->template->owner->id ||
>       |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>       |                                                 |
>       |                                                 (2) when the condition is evaluated to false
>   156 |             strcmp(id->tplg_name, path->template->owner->owner->name))
>       |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> In file included from sound/soc/intel/avs/path.h:14,
>                  from sound/soc/intel/avs/path.c:15:
> sound/soc/intel/avs/topology.h: In function ‘avs_condpaths_walk’:
> sound/soc/intel/avs/topology.h:152:13: note: at offset 4 into source object ‘id’ of size 4
>   152 |         u32 id;
>       |             ^~
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: avs: replace strcmp with sysfs_streq
      commit: 45e9066f3a487e9e26b842644364d045af054775

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


