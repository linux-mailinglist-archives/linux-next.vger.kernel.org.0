Return-Path: <linux-next+bounces-2547-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B6878907D88
	for <lists+linux-next@lfdr.de>; Thu, 13 Jun 2024 22:39:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AAAEE1C21D96
	for <lists+linux-next@lfdr.de>; Thu, 13 Jun 2024 20:39:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29A0013B2AC;
	Thu, 13 Jun 2024 20:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="FNz012tG"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-26.smtpout.orange.fr [80.12.242.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8430137905;
	Thu, 13 Jun 2024 20:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.26
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718311166; cv=none; b=qhVN5NmWx4EzCyuH7Hf0rTygk3l3/eLcbmfoMnFmyckYw2ciL5cFwhNVHrmTii4kS6KxjUdXgxnsKU4dTDWQkJX16eo39sklRmZft0rUkMWTGmyEaqBRfRMnsOW3sRYf4nUEGUDVYQTB5P8gC+UsS77MZIzGSr42eSCdrb0uoRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718311166; c=relaxed/simple;
	bh=I8gRIi2tdxobdYcQwtNcLo7D0+WLao4oQLpSk9VGsd4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aivuZAnTmJKVB3GEBTL2iGH+a9QiTbzmSv2sRt/7XSN+GQ6jnGC7uSQ3PTxHZ/yk/saPd2vQfB4Z3RMgsHFV2OQxYPK2vwEYarb9JHgY5t+8V6WKFIdAJa/FjXvSYc7OehMmeTkVXwaKHd72J3dnEGN2cGlV11aKFqb9gJyjzok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=FNz012tG; arc=none smtp.client-ip=80.12.242.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([86.243.222.230])
	by smtp.orange.fr with ESMTPA
	id HqihskRdZzBzYHqihsC6L4; Thu, 13 Jun 2024 22:06:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1718309213;
	bh=XRaMoPqcQEHhhGv65L0zaAfzpWmzmbt3FcfVA4d11vc=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=FNz012tGnpXwimGS2ZPNBYPk07XwB2DRtd4sKHikpv/oIMXvLx+UcSkHqRDo4DeQC
	 xs5rhCoDST8vj3aWQKXTHtG2wkXg6p21xVVcak5M1kdkLTaGe1oFQXjT4z2wAEPQqI
	 SfUpOHmz0VAt251TQ/hF+xI4GLPGMo66qH9/iG4w6PPeljyUDBoBlb+fjWWvbNaqzK
	 4cl0DrlT0aqIV2q1crlvTRlRdzazcSG0tJ2sR0Myfahih3PFH3ULLKQq8WBvZhJDqP
	 hJaHBBwBw6iI4Vnn5yGkaGFT0BRQzaK8J/i0n55XDpzpsjD/eAuroK5PwOZEmxGSzF
	 hh+jBcAsSb0rw==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 13 Jun 2024 22:06:53 +0200
X-ME-IP: 86.243.222.230
Message-ID: <35b8a2e6-dc26-456e-be93-e929c6c8ca64@wanadoo.fr>
Date: Thu, 13 Jun 2024 22:06:50 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: duplicate patch in the vfs-brauner tree
To: Andrew Morton <akpm@linux-foundation.org>,
 Christian Brauner <brauner@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20240613104837.346519cc@canb.auug.org.au>
 <20240612192141.69896438b5f6e674e07d418e@linux-foundation.org>
 <20240613-verbogen-daneben-84c61797c60a@brauner>
 <20240613124307.df90ed3225c7454ad81ac76c@linux-foundation.org>
Content-Language: en-MW
From: Marion & Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20240613124307.df90ed3225c7454ad81ac76c@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Le 13/06/2024 à 21:43, Andrew Morton a écrit :
> On Thu, 13 Jun 2024 14:17:01 +0200 Christian Brauner <brauner@kernel.org> wrote:
>
>>> Christian, if procfs patches are to henceforth go via the vfs tree,
>>> let's be a bit more organized about it?
>> Sure. I simply didn't see any any "applied" message from you so I just
>> assumed to pick the parts that are relevant. Sorry about that.
> No probs.  If the author didn't cc you then my remember-to-cc-christian
> brain cell is unreliable :(

I guess, that the author is me.

in my .gitconfig, I use

[sendemail.linux]
     tocmd ="`pwd`/scripts/get_maintainer.pl --nogit --nogit-fallback 
--norolestats --nol"
     cccmd ="`pwd`/scripts/get_maintainer.pl --nogit --nogit-fallback 
--norolestats --nom"

and

 >scripts/get_maintainer.pl --nogit --nogit-fallback --norolestats --nol 
fs/proc/generic.c
[EMPTY OUTPUT]

 >scripts/get_maintainer.pl --nogit --nogit-fallback --norolestats --nol 
fs/proc/generic.c
linux-kernel@vger.kernel.org
linux-fsdevel@vger.kernel.org


Should MAINTAINERS be updated somewhere?


(sorry for the mess I've generated :( )


CJ


>
> It'll be at https://lore.kernel.org/mm-commits/ but that's a hassle.
>

