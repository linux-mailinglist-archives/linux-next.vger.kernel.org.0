Return-Path: <linux-next+bounces-2977-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61CB592FCF6
	for <lists+linux-next@lfdr.de>; Fri, 12 Jul 2024 16:54:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9A0061C22F60
	for <lists+linux-next@lfdr.de>; Fri, 12 Jul 2024 14:54:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01413172BB6;
	Fri, 12 Jul 2024 14:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="lP3VY3Ng"
X-Original-To: linux-next@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D5F4EAC7;
	Fri, 12 Jul 2024 14:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720796077; cv=none; b=bmXEta5+uBszesfszVlVFHpcB51Ke7xhQv8eUHZj10K/614kGcjomGBE52LBHQF6gjxBAL+mqPV+BNAK+xuisEWJJHWEIdWCwMoNIOKciSzTVWsWb0iuPbk05XoGhv2ofsWz9J4jws1RhiMVWoqdr//qcl+XTeDni7oUPUpIees=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720796077; c=relaxed/simple;
	bh=YW6LyqOG5vH7lucFATlUG1ixa82tnD7jzg0M9MsPa5A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=BJCK4afF03fnfH7EiIGb5GKCULn65/S40jsans2REyG/S6gFRlq1WWqP78/Ol8w45MorTyhyNV7R3LDYJ1PFFlCoJknxc62v5WsP/DVbHtFGp5GhBAsQrijb7wn9KR/x9dyKONQSNavrMDTOwF5z9PhlDnUniY2xueY7TXS6ttE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=lP3VY3Ng; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 65CBA418AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1720795700; bh=FODPk4cnpB7NBQQ/6uarYjITFGV79B8qfu0oUx5Z4dY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=lP3VY3NgASYQEyeWBUhEQLsuTUaR9i+qhLSxz+KwMQnlRubV31pGZdww/d2b/G9qx
	 JGY3kh048INk3uJaAhJR3rI5YjdRP9VX1kPfhySXavkssWcNrduIaXeuwR5eBgf7nj
	 uBAmaR18F3Dyn9rRTqmA7PTkYWLSgxmJ3mfN79ba6/jHOXeTYv7rXEKUu9rPuosBIP
	 NHhtFW2LVuXJbE+7A6hLUDuE70andtfVOMgtVPr1M+B3+YrFIFoy3WZBAEVUdhsHOv
	 3dTIoFHzdzU/fqO3Qppoi+WkcoQUYSjGVdKzJCLIqhpVEmIfHx+i5sGpkq131ixdRv
	 gH314FLN68RmQ==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 65CBA418AE;
	Fri, 12 Jul 2024 14:48:20 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Tejun Heo <tj@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the cgroup tree
In-Reply-To: <20240712165107.7b46a640@canb.auug.org.au>
References: <20240712164354.65cb32bc@canb.auug.org.au>
 <20240712165107.7b46a640@canb.auug.org.au>
Date: Fri, 12 Jul 2024 08:48:19 -0600
Message-ID: <8734oe1xak.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi all,
>
> On Fri, 12 Jul 2024 16:43:54 +1000 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
>>
>> After merging the cgroup tree, today's linux-next build (htmldocs)
>> failed like this:
>>=20
>> Sphinx parallel build error:
>> UnicodeDecodeError: 'utf-8' codec can't decode byte 0xfd in position 558=
: invalid start byte
>>=20
>> Caused by commit
>>=20
>>   704f684e15ad ("cgroup: Add Michal Koutn=C3=BD as a maintainer")
>>=20
>> I tracked this down using
>>=20
>>   git diff stable.. | cat -v | grep -F 'M-}'
>>=20
>> and finding the commit that added the line that was output.
>> I tested it by building with the commit temporarily reverted.  I have
>> left that commit in today's linux-next.
>>=20
>> Clearly (I think) there is nothing wrong with the commit, but the Sphinx
>> utf-8 decoder also clearly does not think it is valid UTF-8 :-(
>
> Actually my character map app says that it should be the two bytes 0xC3
> 0xBD in UTF-8 (it is 0x00FD in UTF-16).

As you observed, the patch is encoded in ISO-8859, not UTF8; that
doesn't fit well in a file that uses UTF8.  One could argue that Sphinx
should be a bit more robust, but satisfactory results will not be had
regardless.

An encoding check might be a useful thing to have in checkpatch.pl,
methinks.

jon

