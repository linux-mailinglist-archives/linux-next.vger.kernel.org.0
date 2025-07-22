Return-Path: <linux-next+bounces-7691-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FE9B0DEF6
	for <lists+linux-next@lfdr.de>; Tue, 22 Jul 2025 16:39:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C2C2EAC417C
	for <lists+linux-next@lfdr.de>; Tue, 22 Jul 2025 14:34:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE2682EB5A5;
	Tue, 22 Jul 2025 14:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BbRijO5S"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826732EB5A1;
	Tue, 22 Jul 2025 14:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753194837; cv=none; b=U4p67MVmEGTf9q8CT+0GIsGPDGOfw9oHdONPfL31/JUFxRyX1zucUf5doiDaeu8V3pKg1w3saHZKjC9743ZA6kpFQiDrq9QO7DACWqTExeqkavV08cIBb8Ecm7d/z51cqUFtC0SPdlID9jhk0QnoNHO1hs2XBYxHPiwycOK+Tpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753194837; c=relaxed/simple;
	bh=K192NpMj7rcBD1vebJP5mJu6UpyCRmqyL45mPGrycI8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=iPPc/Zny3OUj30PIt+qsknaaPJbbKRQPrl3mnJ0QjPdH0B1qQg3qsVr8gTLR4lIzLFdtPBxy8XK70BKOpQnyi/T4BpJ/h1j7gc5UajxClQiLOG/Nj5N4yfljjKJCmQFAIOMYmiJRwEhFxl59oAmRNFEB49zwDKYxrgRFzJATQTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BbRijO5S; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F0E5C4CEEB;
	Tue, 22 Jul 2025 14:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753194836;
	bh=K192NpMj7rcBD1vebJP5mJu6UpyCRmqyL45mPGrycI8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=BbRijO5SKvXPpof3AfLHhoV+ISe42MvbLaOxncfc8nFyVk7qks+ZQISptRynYKxoi
	 yH6xyLpVp4Slw3xx9xjpOk8oG3iS0BKWTs1FIXqgH5efbdRXI8EfBa+BzEzyyUkKJk
	 L8emOZyGK59rAk+H79hipCgmIYW5tgzUmpSjn/ucl6S/jarEy8WBjqxTA472f5VOqm
	 mzfK0G1TGUU/VARXsdePzs9iYl08GS6TsIeVMR06ZJUMPa+g0Q6FbesAkUKCcaLh6W
	 tYcgVpOGH+W7Ik7KIukIVhfvjkgjH909lkz/cX1m2guO9RIW6ZPIHps4MUPJLuUeXC
	 gWs/P5uXqhc2A==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com, 
 pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com, 
 sfr@canb.auug.org.au, boqun.feng@gmail.com, linux-next@vger.kernel.org, 
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com
In-Reply-To: <20250722102754.2514351-1-ckeepax@opensource.cirrus.com>
References: <20250722102754.2514351-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: SDCA: Check devm_mutex_init() return value
Message-Id: <175319483403.46177.1552499643444873384.b4-ty@kernel.org>
Date: Tue, 22 Jul 2025 15:33:54 +0100
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cff91

On Tue, 22 Jul 2025 11:27:54 +0100, Charles Keepax wrote:
> Fix interaction with commit daec29dcc873 ("locking/mutex: Mark
> devm_mutex_init() as __must_check"), add return value check. There is no
> need for additional complex error handling here, failure to init the
> mutex means the code can't progress, so the failure just needs to be passed
> up to the caller.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SDCA: Check devm_mutex_init() return value
      commit: 5b838a24e9942d8b8da208f924701d0f989778cf

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


