Return-Path: <linux-next+bounces-8787-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C03BEC296D1
	for <lists+linux-next@lfdr.de>; Sun, 02 Nov 2025 21:59:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 133C7188C408
	for <lists+linux-next@lfdr.de>; Sun,  2 Nov 2025 20:59:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 538C820C463;
	Sun,  2 Nov 2025 20:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=t-8ch.de header.i=@t-8ch.de header.b="H3yJtcIa"
X-Original-To: linux-next@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14EF6AD4B;
	Sun,  2 Nov 2025 20:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762117166; cv=none; b=Y75wfqt4cRS4hH71CZYSfCpdC0IfYghdrCH5mn6aAhSLkAHJGcj5YksiRbwixtlea0mv6M4+GForoV9ubgPItCbEawIoAtpq4gfz7otWqpo1/QwOCZ15a0+VY9Tvq/BQjGOtLNYEsQfoMkZNmpvRcKN01xg946k9nD008C82FxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762117166; c=relaxed/simple;
	bh=u09McaGxeg1ol+OR5CbLPfQNR4p051B6PybF/FpWCsk=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=RV7oyaAuKJ0oYybEAF0nyVmw/bumnowfqrkmK58e7XunD9+imqmMR9qxkJpVYlfV2EM9b5PhFPLBmUqt4gWa4AEjomuaEZSlgrSXsLyb9+XUPIbnxkqQ89jg/JZZJnZ2ihoIVFLHMUKj0/jFFPcY2qNFxewYc5fd/j2Cdz6dclg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=t-8ch.de; spf=pass smtp.mailfrom=t-8ch.de; dkim=pass (1024-bit key) header.d=t-8ch.de header.i=@t-8ch.de header.b=H3yJtcIa; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=t-8ch.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=t-8ch.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
	t=1762117161; bh=u09McaGxeg1ol+OR5CbLPfQNR4p051B6PybF/FpWCsk=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=H3yJtcIa6otsntDpiPiA1zpADphXZ+Za7Ap9xh9NGx8cSv1VnDYMd68FpYn5rpovn
	 gHDRkTFCihbYxsq4GpNdg4L9EjqzxI7176CErgW1LwyGWbcjziNQkg3fypaLOV9xUT
	 cBtM1l40PL8mTPYYk7iNbpuLh9LYgABQJWllAeg4=
Date: Sun, 2 Nov 2025 21:59:15 +0100 (GMT+01:00)
From: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh_?= <thomas@t-8ch.de>
To: Willy Tarreau <w@1wt.eu>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Shuah Khan <skhan@linuxfoundation.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Message-ID: <a4385fcf-f794-4d2f-928d-5eeca839cb3c@t-8ch.de>
In-Reply-To: <20251102205735.GA27552@1wt.eu>
References: <20251103075200.7961a782@canb.auug.org.au> <20251102205735.GA27552@1wt.eu>
Subject: Re: linux-next: Signed-off-by missing for commit in the nolibc tree
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Correlation-ID: <a4385fcf-f794-4d2f-928d-5eeca839cb3c@t-8ch.de>

Nov 2, 2025 21:57:37 Willy Tarreau <w@1wt.eu>:

> On Mon, Nov 03, 2025 at 07:52:00AM +1100, Stephen Rothwell wrote:
>> Hi all,
>>
>> Commit
>>
>> =C2=A0 926b414bee07 ("tools/nolibc: clean up outdated comments in generi=
c arch.h")
>>
>> is missing a Signed-off-by from its author.
>
> Oops, sorry for this, you're right! Thomas, I can prepend my s-o-b and
> push-force it if that's fine by you.

Works for me. Although in this case you should probably drop my Signed-off-=
by and replace it with an Acked-by.


Thomas

