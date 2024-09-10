Return-Path: <linux-next+bounces-3721-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7049729C0
	for <lists+linux-next@lfdr.de>; Tue, 10 Sep 2024 08:45:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D8403B24472
	for <lists+linux-next@lfdr.de>; Tue, 10 Sep 2024 06:45:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A57E17AE1C;
	Tue, 10 Sep 2024 06:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jY5B5E7T"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1614E17AE1D
	for <linux-next@vger.kernel.org>; Tue, 10 Sep 2024 06:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725950705; cv=none; b=i46Fo9CcTCAyAjl5lD4Gs+VSv+RM82Eo40CV43lD8F4Cz7v0cpz/Wf/BtlOsjhHGCbfQgyMFBzlNzSovyt18ffxEeEBWMeej0CubLKijLctSy6zSiSMnMz27cLAX3hj72TBq80xN+7SSuvXm/V/GXdwnmoHbV+0Y3t4I82GIaoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725950705; c=relaxed/simple;
	bh=opiocva7Rai1iD4KldoLr/MHHio9MO1WpdSLvr8wtVI=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:Message-ID:
	 MIME-Version:Content-Type; b=j4zEi+r15SciBeH0r+lLGKFKgv567sMJ1k+t6cI1qtZKVClhKfXXa2GmwdL0IKRV2DcmeaY456zAKBtBM8uEG5kn5O81X7UfpSbRsDKGy55ZfAJb9s0cAM5Dq2ZTVfQwMOutFCwXem9+CqfZHTbPyzv9SiI+ugfyuXa0JDQdkrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jY5B5E7T; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 041EEC4CEC3;
	Tue, 10 Sep 2024 06:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725950704;
	bh=opiocva7Rai1iD4KldoLr/MHHio9MO1WpdSLvr8wtVI=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:From;
	b=jY5B5E7TcbNBaixSVnV6UC/5VCinppmG/0vgrvnFsWl4G2KroDbz3/Tx5EPJoMtOV
	 g1xoi8u9sV5Z5oNXEbo3j7oJqW/MDYYK/mvkaZdSkDPu0c9itZI7/HnrFnu8c6tQwq
	 SmrTLbmxNCxN4VESPJlEOwXGewqtR8yCkhz2YiG+h55k/6Ae9JVVrJBAi55gzVEXTl
	 ECFEto7Qs7+ycXjwoi3V1//er5lEKXbUW0TzNBxZHU/UE5B6ec0WA5bhXSYM5ktkRe
	 mGN5F/ZZUROhz4pplgBPqZRT9ATFCKkIGcc6WQoHIoB+QpNz1QRRkPLA3zTORriUBR
	 4Mtaf5i5NupbA==
References: <87v7z586py.fsf@debian-BULLSEYE-live-builder-AMD64>
 <20240909-einjagen-meterhoch-45c77ca03164@brauner>
 <CAJqdLrq+pScjJdnrp2jAZMqKEq-SyEjsBdb-=9QAFN6=h1=S5w@mail.gmail.com>
 <20240909-unwillig-irreal-26bd9fa085c6@brauner>
 <CAJqdLrqjD_vXVm48LG-9HM_wRsSFUg46rrWFL+o24n6dLgQJ6g@mail.gmail.com>
 <20240909-arterien-zweit-3502f11b9f50@brauner>
 <CAJqdLrpA4B3rKOWcwYyBA14ofPiSba2qrAggYBE2D_h70zni2A@mail.gmail.com>
 <20240909-zumal-revision-8af9dc0593e5@brauner>
 <CAJqdLrrz-DH0YLbMFt951c4jiZMAiCVcS0YR3Mz-y=O3zNn6Kg@mail.gmail.com>
 <CAJqdLrpwuaPG3PoFwbxPRp8GrbEWooXazrMZgV4Wj=FK=vq=6A@mail.gmail.com>
 <CAJqdLros2VVCXQ8RK4FeU1+=oX4=K64i7dxbDor+RUepFNJzJA@mail.gmail.com>
User-agent: mu4e 1.10.8; emacs 29.2
From: Chandan Babu R <chandanbabu@kernel.org>
To: Alexander Mikhalitsyn <alexander@mihalicyn.com>
Cc: linux-next@vger.kernel.org, mszeredi@redhat.com, Christian Brauner
 <brauner@kernel.org>
Subject: Re: [BUG REPORT] linux-next/fs-next released on 6th September fails
 to boot
Date: Tue, 10 Sep 2024 12:09:41 +0530
In-reply-to: <CAJqdLros2VVCXQ8RK4FeU1+=oX4=K64i7dxbDor+RUepFNJzJA@mail.gmail.com>
Message-ID: <87frq8atxt.fsf@debian-BULLSEYE-live-builder-AMD64>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, Sep 09, 2024 at 06:11:29 PM +0200, Alexander Mikhalitsyn wrote:
> I'll send a patch with this fix a bit later, once
> https://lore.kernel.org/linux-fsdevel/20240906143453.179506-1-aleksandr.mikhalitsyn@canonical.com/
> is merged to prevent merge conflicts later on.
>
> Am Mo., 9. Sept. 2024 um 17:56 Uhr schrieb Alexander Mikhalitsyn
> <alexander@mihalicyn.com>:
>>
>> Dear Chandan,
>>
>> Please can you check if the following patch resolves issue for your
>> workload:

Hi Alexander,

I am sorry. I now see that the bug is present even after commit
9dc504f244895def513a0f2982c909103d4ab345 (virtio_fs: allow idmapped mounts) is
reverted. I was using kexec to boot into new kernels during the bisect
operation.

However, now when I do a normal kernel installation (i.e. make modules_install
&& make install) and reboot into the new kernel, I am noticing that the kernel
fails to boot even with alleged bad commit reverted. I will write back with
more details.

Apologies, for the inadvertent mistake.

-- 
Chandan

