Return-Path: <linux-next+bounces-9335-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AF75CCA40AE
	for <lists+linux-next@lfdr.de>; Thu, 04 Dec 2025 15:36:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 65617313093D
	for <lists+linux-next@lfdr.de>; Thu,  4 Dec 2025 14:29:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3738F342146;
	Thu,  4 Dec 2025 14:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l9R0NTZS"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5E23054F2;
	Thu,  4 Dec 2025 14:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764858550; cv=none; b=MnOzXdp5OK7t7qSFrV9cQ0ZqMyr/XD/4RLJnxpsUnxncPL9aLpt9eL1yjousF/LkQdrdlXq81KHI2QeK+RoDZ6I1LwAAxG/NVjGgMXzGc2vaYy8OVpMSfvOvAA2gjI24KJFihq+3ViHPcgJK8lxkGNcB6lwYJ1iCnwo6OE8jIYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764858550; c=relaxed/simple;
	bh=Sf7XLWB0S+LefPXoCixRYIhov1BR0IB2K8dusYgN1qs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=m5geRTRuhRMVx+jXuvOMU++7BoyxSgz3GyppK1/VosgCy5ymq6EkNpINs0pQT09nXwqsi+QMSDlR6RwtEWGL0o1tX7E6Uh2OQmf6O53oZsKTHAOG+g5ZnWaCpv9JyilfDAfp1vvuGL7dEu5KGmK7KXTVn63fA8/VTXmzpuzI2F8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l9R0NTZS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CA48C116B1;
	Thu,  4 Dec 2025 14:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764858549;
	bh=Sf7XLWB0S+LefPXoCixRYIhov1BR0IB2K8dusYgN1qs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=l9R0NTZSufm/nOE5mVrDQqw65PkW35TBXA4WipPZ6iRKYbWoVQHRcHcZFz2UaDwfV
	 sHiC0U2xUeW/0YnCgo6NvkjBkW1bUj+AhZTNxrZn+i89lubWgxNg2KmiASLJrjrNQ6
	 +uImv8RnkZPgzNYK+Qb5ZWhWDDx/AZaowuiuDfHPhLlFYhxmNUY8N9e6wc+5KE16Du
	 h/AbJ8/LvE+UJwOohmFuCg3h3AiOLaU5k8cvn34jDQ0opFpBXm0w73cI5Bw+wC5qCY
	 6bDQgCAdXGWpRUoIN2Hxx6HA/WwuQ1amDj+RnbSnGOhm1gC8ckPdzGfqQLGayLlPwo
	 a4V5Hoo7Mj7/Q==
Message-ID: <6e8517751e4f41ee9233bdba52362d5a70c3d6b1.camel@kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the nfs tree
From: Trond Myklebust <trondmy@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Anna Schumaker <anna.schumaker@oracle.com>, Mike Snitzer	
 <snitzer@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>,  Linux Next Mailing List
 <linux-next@vger.kernel.org>
Date: Thu, 04 Dec 2025 09:29:07 -0500
In-Reply-To: <20251204183644.5757c050@canb.auug.org.au>
References: <20251204183644.5757c050@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2025-12-04 at 18:36 +1100, Stephen Rothwell wrote:
> Hi all,
>=20
> In commit
>=20
> =C2=A0 869b7402a7cb ("nfs/localio: fix regression due to out-of-order
> __put_cred")
>=20
> Fixes tag
>=20
> =C2=A0 Fixes: 86855311c117 ("nfs/localio: add refcounting for each iocb I=
O
> associated with NFS pgio header")
>=20
> has these problem(s):
>=20
> =C2=A0 - Target SHA1 does not exist
>=20
> Maybe you meant
>=20
> Fixes: f2060bdc21d7 ("nfs/localio: add refcounting for each iocb IO
> associated with NFS pgio header")

Thanks Stephen! Fixed now...

--=20
Trond Myklebust
Linux NFS client maintainer, Hammerspace
trondmy@kernel.org, trond.myklebust@hammerspace.com

