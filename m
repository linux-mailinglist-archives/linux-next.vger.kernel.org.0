Return-Path: <linux-next+bounces-9712-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0C0D3B514
	for <lists+linux-next@lfdr.de>; Mon, 19 Jan 2026 19:02:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3C783300092C
	for <lists+linux-next@lfdr.de>; Mon, 19 Jan 2026 18:02:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3BD532ED24;
	Mon, 19 Jan 2026 18:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hDPkjupp"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B160632D0DC;
	Mon, 19 Jan 2026 18:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768845740; cv=none; b=a+96NQ+kgisohWDecrYHb0Eutb9v+A4tri5RA+OL1DupEp0voJVKlHbIQfnSRgegZXMZOb/DKJWFOFfkY/kd9q0yNY1iZjww1vC7bfzFwnVV3v/7txrpbQcCj5+g59aZBA4sixD7SD4T6/DKH4LfS3RLMZWD8EQfzJXTOn+GdvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768845740; c=relaxed/simple;
	bh=I1da9P0nDVLM2LzitSpLBr8yOSo3FKe7UCk6SpYxb7I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZOmQOn1I1ziskbqSIVP54ibF8mzcB45HKMG+ulSgCSk9grus2xJ0faxbZE+vSQClwyZMWrkR3S1iAkRZ/tFeihW2a3//9KUc285hvByWKa6RDhCI5d38fuotjRoS+fzpFGXsy/rJ/eV4fg4TGc5/QoSWgCAHR0nDV+u/eVi7LKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hDPkjupp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38CFBC116C6;
	Mon, 19 Jan 2026 18:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768845740;
	bh=I1da9P0nDVLM2LzitSpLBr8yOSo3FKe7UCk6SpYxb7I=;
	h=Date:From:To:Cc:Subject:From;
	b=hDPkjuppYgm2YbFa6a05kKx4kqRtImvSGk9chCVG+bVKIqQvDjtyIpjoZRqob37of
	 p7zBPMRTWd+7KVXIDhNa1ZTrCrHxaTCo5CTaI8azc9kkDvTXsKZQYTvWCaexgNuIi/
	 1xt+ok2guJgRLd3LtUxaFTGqZHg0VY9RwbM//S30VikiSLGZTp22BAlPH9OKtvc5Z5
	 a44894rMm7sLFp60pLe0LigCUmK/HFZ3QxHtOmroHirknEoZE2CLCdSh51vl9RnNKQ
	 pByQwqXOHd3+iFsWHuz4JGWVGokoCB+zGPxsG1m32XFjh5oUtuor5GAqefIw92U96M
	 NNp8nHB0iQMGQ==
Date: Mon, 19 Jan 2026 18:02:16 +0000
From: Mark Brown <broonie@kernel.org>
To: Jens Axboe <axboe@kernel.dk>, Tamir Duberstein <tamird@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the block tree
Message-ID: <aW5xqLq7gatOy1DV@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the block tree, today's linux-next build (x86_64
allmodconfig) failed like this:

error: unused import: `c_str`
 --> /tmp/next/build/drivers/block/rnull/configfs.rs:6:5
  |
6 |     c_str,
  |     ^^^^^
  |
  = note: `-D unused-imports` implied by `-D warnings`
  = help: to override `-D warnings` add `#[allow(unused_imports)]`

error: aborting due to 1 previous error

Caused by commit

  4cef2fcda3ada (rnull: replace `kernel::c_str!` with C-Strings)

I have used the version from 20260116 instead.

