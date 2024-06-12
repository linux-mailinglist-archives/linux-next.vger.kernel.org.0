Return-Path: <linux-next+bounces-2530-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C80905308
	for <lists+linux-next@lfdr.de>; Wed, 12 Jun 2024 14:55:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3DD6F285AE9
	for <lists+linux-next@lfdr.de>; Wed, 12 Jun 2024 12:55:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BCF9176241;
	Wed, 12 Jun 2024 12:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VedoSkYN"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10ADD36AF2;
	Wed, 12 Jun 2024 12:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718196956; cv=none; b=roXyhePGG/GAgnqZ7m1c76bFWESr1xlWIxVkAmPUsbbFUxMYoSaZebtt4GWWVmui82aVaIu1UShjJzPyMNSzV0sotmaq9TFP2Cj7tl6GEWLemuD+9LWW2PLlQkL2v2gWX22SL/4yy0lpe2n75GTDn++cJfc8NdrH5r0i4RN3eog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718196956; c=relaxed/simple;
	bh=LQajmAT5tdxV94n2f65Y/ADCj6Zh6Hl1V86H+5ho60U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GEaQ5WkOwTenBNyAQhkITL+onCFolkcI5LzdQRUhO8SFAbTREWhco+y7h2sjetXolb31Uj2xh90aHerpkZ2U1JAsjSwFRMOZeRfqXEv+9v2T67uyveiU6b50QphkrVSPt+ITAIXDVJu8ruMxrWnfAef599SyyML74KLcl/ZMAgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VedoSkYN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEE73C4AF49;
	Wed, 12 Jun 2024 12:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718196955;
	bh=LQajmAT5tdxV94n2f65Y/ADCj6Zh6Hl1V86H+5ho60U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VedoSkYNinhVCXWmTwmWOX/cqvmce1ZqSG2znPknXC6W0GlpAFyoKrx/QDxpSC1rd
	 eK/VLVisrRIMqCVqmjsL+9Ud4uAjb3ofNPcOvoxdBBEX6x8R7H8tu3OAlAzyN+b729
	 Gzn4yDWhOQg+dmr4LP9CGyPYBA9lME0xyNLpz0V8ALjc5d6Ai84RnUqzN//9XFUOPD
	 +eNdLJBA14JO8yY5jyuuhhzHviAnnkyS2IBHTfdWOcy5bUrDajYHyt+err87ANT9LI
	 zMu1o0VnCLD7ZxadudtvrsIco3i3R3bKaOj7qvlPh6+tHMUHkiLZqoaanRaogx3h9p
	 CdQ8OE9I8IKaA==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52c7fbad011so4886966e87.0;
        Wed, 12 Jun 2024 05:55:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVUQ3OOhwhinlq8v/vDlvO01YDpAgxnB4I+DQ0T7+KNfwfK1/czCx5AUTxeZVXVzNAsAnk2RN7EF5kboQYLpHswxZbmB6fiayMijZuG1pbVp0cZ2VDYXCCR0xGHrXeeZjb3cdm3n5+lpg==
X-Gm-Message-State: AOJu0YzSs7qvaLoBkwfFFtGemvI59Z6CuVlJqRCplyTODvJKrj4bmz9w
	eRATbz0jnQEEOV2AXMwFRTgQGsdGPMNTLdTRVrJSZNKA+v8eTYhyzIOm5gco8lpZwwYZGkkKsd/
	5FRiJ84787KGAMOM9Op7tVhZK9w==
X-Google-Smtp-Source: AGHT+IHlqCANyPk5NnnOPBFpGdcjloDxa3D9UPbW8EZGcbf8tFKLu+GQ6gfRwWDQrwNwF/cY7NUbyFnY3/YPK22y52Q=
X-Received: by 2002:a05:6512:4889:b0:52c:9f6e:c9be with SMTP id
 2adb3069b0e04-52c9f6eca6dmr51983e87.36.1718196954220; Wed, 12 Jun 2024
 05:55:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240612162848.2949c33a@canb.auug.org.au>
In-Reply-To: <20240612162848.2949c33a@canb.auug.org.au>
From: Rob Herring <robh@kernel.org>
Date: Wed, 12 Jun 2024 06:55:41 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+YZFsxubEdye7xA0_rLLbrzK19F=hn+uRqKA+q6W_xqA@mail.gmail.com>
Message-ID: <CAL_Jsq+YZFsxubEdye7xA0_rLLbrzK19F=hn+uRqKA+q6W_xqA@mail.gmail.com>
Subject: Re: linux-next: duplicate patch in the nvmem tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 12, 2024 at 12:28=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.or=
g.au> wrote:
>
> Hi all,
>
> The following commit is also in the devicetree tree as a different
> commit (but the same patch):
>
>   89ca7c2d13bf ("dt-bindings: nvmem: mediatek: efuse: add support for MT7=
981")
>
> This is commit
>
>   ee96c0a8d12f ("dt-bindings: nvmem: mediatek: efuse: add support for MT7=
981")

Now dropped.

Rob

