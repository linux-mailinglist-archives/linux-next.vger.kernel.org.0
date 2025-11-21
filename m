Return-Path: <linux-next+bounces-9148-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id CD516C7B7E1
	for <lists+linux-next@lfdr.de>; Fri, 21 Nov 2025 20:22:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 631BB368826
	for <lists+linux-next@lfdr.de>; Fri, 21 Nov 2025 19:21:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02EDB3009C8;
	Fri, 21 Nov 2025 19:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q0adVIH8"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04022FFDFC;
	Fri, 21 Nov 2025 19:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763752878; cv=none; b=aQmxSM0ds2nB3kbwQzm8mHnpM7UDvP7uMCUCl1ZHUWxRxWO68R9Q+td/w50d0MSjdxHvn/jcBNq93vRKR/jTvokSEMUPQ2FtEhps6dr8OM+MUPV5LjUDvxepHNc7by3xlRSDqkLaocv1maD2kr2GP6EQeRjAnSQFisoSo/7yf0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763752878; c=relaxed/simple;
	bh=Of4U2yBCnHjDHLQ1p6pkTcnkNlTPgX4MAO0GdHOVKfY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=A3RG/7bORvghey969eOMbCjdZjRxdMlkO5tItodR0raToPbDQJGGV9Ffo4tnckmrx/p+HykSwB0rB+k0HAcxf2ryQs+B52d2ujNmucSyPjS5G2wHintBNItfEJBslzDYefz40YNUg7b0FYiZ6cJvmnpR9bZixciODFz/jTCwcvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q0adVIH8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2B5FC116C6;
	Fri, 21 Nov 2025 19:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763752878;
	bh=Of4U2yBCnHjDHLQ1p6pkTcnkNlTPgX4MAO0GdHOVKfY=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
	b=Q0adVIH8sfUo6Sx8cJRwziYncLIrUG5e+1hopv9829qbnD3mi7JmxAAGlHzDi9c16
	 1K+mqPKklQzaDIuZetRvZAnpP4zEJwJ6SCQ+sHikOSdJxemj9pQFZcLvhgge9OphGj
	 2yr+r7qph3BrBTFTnPXrTC1fX5IWd6RrArh1Bqn0O7ISGy0r3EkMZF+qGsThmAMOVJ
	 SB2V8zcS8F5miAZcZQEe1UG+GpJV3CnyaZyHfOFdmCSfPerGrt176bLbg/bpgWnE7v
	 /rWICm0RWio6d734ZiEv6v0/+0PsBGxf/B8uEbc7ziPwdarE7CvamuNSeyOXYDTmHA
	 3jjyxrpZodH5w==
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 22 Nov 2025 08:21:14 +1300
Message-Id: <DEEM7OSVJS5K.TW119OQM84RS@kernel.org>
Cc: "Greg KH" <greg@kroah.com>, "Tamir Duberstein" <tamird@gmail.com>,
 "Stephen Rothwell" <sfr@canb.auug.org.au>, "Igor Korotin"
 <igor.korotin.linux@gmail.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Rafael
 J. Wysocki" <rafael@kernel.org>, "Linux Kernel Mailing List"
 <linux-kernel@vger.kernel.org>, "Linux Next Mailing List"
 <linux-next@vger.kernel.org>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: linux-next: manual merge of the rust tree with the driver-core
 tree
References: <20251120181111.65ce75a0@canb.auug.org.au>
 <CANiq72mW=zMbt2W2Omn4PnMDDJfqz3tDtrneMOFz2ysQ34T8zg@mail.gmail.com>
 <CAJ-ks9=LxO8zTy7rQCiXrZGuwwN5d0gqVkQVE_S2QZnXTdu-Ug@mail.gmail.com>
 <20251121153906.1d306ad1@canb.auug.org.au>
 <CAJ-ks9k1=BLFCfjVrMqQ5u_ak6+g=HtQ6_TP4ZtazPhk0Z76YA@mail.gmail.com>
 <CANiq72kxj-7VjYp2i2VFU5qoRd6OJKPfajZAg+HMX148DU5zqw@mail.gmail.com>
In-Reply-To: <CANiq72kxj-7VjYp2i2VFU5qoRd6OJKPfajZAg+HMX148DU5zqw@mail.gmail.com>

On Sat Nov 22, 2025 at 4:56 AM NZDT, Miguel Ojeda wrote:
> On Fri, Nov 21, 2025 at 1:17=E2=80=AFPM Tamir Duberstein <tamird@gmail.co=
m> wrote:
>>
>> I don't see why not. It does not depend on changes in the rust tree.
>> @Danilo Krummrich?
>
> I think Danilo may not be near a computer at the moment -- Greg, I can
> send you a patch to apply (or we could just leave this as a conflict
> resolution to be applied by Linus too).

Yes, a patch would be great -- thanks for providing the conflict resolution=
!

- Danilo

