Return-Path: <linux-next+bounces-8716-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA51C0CB4F
	for <lists+linux-next@lfdr.de>; Mon, 27 Oct 2025 10:38:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7EB9C188B438
	for <lists+linux-next@lfdr.de>; Mon, 27 Oct 2025 09:38:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C32C2F1FD8;
	Mon, 27 Oct 2025 09:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SDNMxkyF"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D80292F12B7;
	Mon, 27 Oct 2025 09:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761557889; cv=none; b=KzbtPuj7gimHwLLeW188cjTmfQQpCg3VHC14fUS0qZ/a04PdJtreR/MPHc/RC7Szm+t3NSaIcCCsWzTOKckGzbgCW6j07lmU1/r6UrN4C/9CmtKlTk/pwiO/RLErHt+N2IqSq/NI2CmA3OCxCETRAW0DVOdq74S3DOxzHtKJ4pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761557889; c=relaxed/simple;
	bh=LcCNkfQqc6fS8oLgepGPr8wql4ER1V2SJ28eeLEfDT0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=J/uzwJolnCs6LPZZ7aq11r0ezgCmghswU6YkEjQywJmLDploNfSq+OR3rfqZUMUdfXGe7ZimYtz3QC/DKh2lunO+W0THCj/mKb0U10Z5maQAL1xTnzZ2wwYx4ek3IWJ3ctYCIYenTOw96HO18gba0qFpgYWpOhiMnAONXnVqqgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SDNMxkyF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDC16C4CEF1;
	Mon, 27 Oct 2025 09:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761557889;
	bh=LcCNkfQqc6fS8oLgepGPr8wql4ER1V2SJ28eeLEfDT0=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=SDNMxkyFF3osDqgJrxAUZy4jbdvJu6UfUbSTiJw4ha/+siP+Q4jRvszfGxwHkBpPV
	 Bw9VIMD+6TKUzSWpeFsj9Xr17UlblAUbkqrX8Ne8xmUVaScm1A99ppTjM7eWP0rWaW
	 tlUAioJrn7xj1ySiaa3KW6RaV2QKjyzXT0IV2N+r290yYG6PAhRVh3RvNkvH1P7QPA
	 OiTt9qdOM7ZchZUNquG5HqNIEIN18wtjY3dwelXIFrOPB/bUt37O/uarEyDMF2Ya1W
	 XK3I8l45CPBOFVFqleUJ0XNX0KZbdsgtv87EeONCGGuOn80Pqdobi8D+63k9wXC1Aw
	 ONKU78SYySMmA==
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Oct 2025 10:38:05 +0100
Message-Id: <DDT05KLECH04.37PKIHQQ4K3MX@kernel.org>
Subject: Re: linux-next: build failure after merge of the pwm tree
Cc: "Stephen Rothwell" <sfr@canb.auug.org.au>, "Michal Wilczynski"
 <m.wilczynski@samsung.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Peter Colberg"
 <pcolberg@redhat.com>, "Lyude Paul" <lyude@redhat.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Linux Kernel Mailing List"
 <linux-kernel@vger.kernel.org>, "Linux Next Mailing List"
 <linux-next@vger.kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "Viresh
 Kumar" <viresh.kumar@linaro.org>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20251027125148.7f7d8ed6@canb.auug.org.au>
 <22fl35khmbf6ufyjzbfvxor7b6nohqakqovjoya3v4mmlenz5c@6wbdednrd2pb>
In-Reply-To: <22fl35khmbf6ufyjzbfvxor7b6nohqakqovjoya3v4mmlenz5c@6wbdednrd2pb>

On Mon Oct 27, 2025 at 9:11 AM CET, Uwe Kleine-K=C3=B6nig wrote:
> Translating the changes that commit does to
> drivers/gpu/drm/nova/driver.rs for drivers/pwm/pwm_th1520.rs results in:
>
> diff --git a/drivers/pwm/pwm_th1520.rs b/drivers/pwm/pwm_th1520.rs
> index 0ad38b78be85..dd554574adc8 100644
> --- a/drivers/pwm/pwm_th1520.rs
> +++ b/drivers/pwm/pwm_th1520.rs
> @@ -328,7 +328,7 @@ impl platform::Driver for Th1520PwmPlatformDriver {
>      fn probe(
>          pdev: &platform::Device<Core>,
>          _id_info: Option<&Self::IdInfo>,
> -    ) -> Result<Pin<KBox<Self>>> {
> +    ) -> impl PinInit<Self, Error> {
>          let dev =3D pdev.as_ref();
>          let request =3D pdev.io_request_by_index(0).ok_or(ENODEV)?;
> =20
> @@ -365,7 +365,7 @@ fn probe(
> =20
>          pwm::Registration::register(dev, chip)?;
> =20
> -        Ok(KBox::new(Th1520PwmPlatformDriver, GFP_KERNEL)?.into())
> +        Ok(Th1520PwmPlatformDriver)
>      }
>  }

Yes, this looks good.

Thanks,
Danilo

