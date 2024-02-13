Return-Path: <linux-next+bounces-1140-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC88853349
	for <lists+linux-next@lfdr.de>; Tue, 13 Feb 2024 15:37:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5138E28B340
	for <lists+linux-next@lfdr.de>; Tue, 13 Feb 2024 14:37:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 834165DF19;
	Tue, 13 Feb 2024 14:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="UTxhFups"
X-Original-To: linux-next@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C603C5B1F5;
	Tue, 13 Feb 2024 14:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707834994; cv=none; b=OdHfGBED34QMPMSVEf6mDHEsfkQW5rfUVG+LspPlLIXVmDVPJTvasB5QBxcQOF+IFnDa6yPyYKnb8LkFF+BRnZMFK3TymLba5ZDGL5InTH2hBYAUsJevxKdOZEBNn0IEwi7fX94VU4Av2YYuZmt8uhVb87ejIA4nesG5cOQ3Fy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707834994; c=relaxed/simple;
	bh=/zbt2QOI51DDZ6NKcvMil/0WsuCxSVFcjFW3TT24A48=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=P/0bYcKISPqqOLnEWw6U27QLHkayk7/R0gBkMPt1JxhkcFgRpIS9cUmkz5Bch+tOTfrZaniYfo7RJsOgewF4Sgt7cue2JaXM9xTYE7wtAeAvGk7Mc9S9erEdY9FXHjtoLNmn3yTCxejx7/3JzW6GcXdm/tUH0pUn7rk5Sx/C9dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=UTxhFups; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net EE6C141A29
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1707834992; bh=m7VDYDh4G7pMQR9nsgt5m4pndEhowuieASNNhwcms7Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=UTxhFups/810ofeEVWxPkN7k8XUXaI3ntAhSJWHRR+xDIHxorYTih072vDcbmVqoP
	 sVDdYytvch4UJUMhvWdG/QfWqewsPdihDzfsLBjGYC77dimVXGhOeevUn9rM09LHqK
	 BQtHjpoTHK9USnr0hrlGuP1L6crpfhpXIjbBpgJH18cYNuA54rlnnUUW49JTrT/kda
	 7bCvySj5cTXCMRnM3br+PEAIy7rzDt0YyGTS0lNN1raqAjtxt7x3bpOChc+fj+P6sA
	 /9XdN81rPjbh8uLGlkp7gnnUUTcAOM31gp07wbs8kgW1obXp9vF2RWSVaLCw6D15Sz
	 kgmQNghSLM2qw==
Received: from localhost (unknown [IPv6:2601:280:5e00:625:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id EE6C141A29;
	Tue, 13 Feb 2024 14:36:31 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the jc_docs tree
In-Reply-To: <20240213154916.39f70814@canb.auug.org.au>
References: <20240213154916.39f70814@canb.auug.org.au>
Date: Tue, 13 Feb 2024 07:36:31 -0700
Message-ID: <8734tw77o0.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi all,
>
> The following commit is also in Linus Torvalds' tree as a different commit
> (but the same patch):
>
>   b37c416b28ed ("docs: kernel_feat.py: fix build error for missing files")
>
> This is commit
>
>   c23de7ceae59 ("docs: kernel_feat.py: fix build error for missing files")
>
> in Linus' tree.

Interesting...I thought I had taken pains to keep that from
happening...will go look.

Thanks,

jon

