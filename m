Return-Path: <linux-next+bounces-2210-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBAB8BEDD7
	for <lists+linux-next@lfdr.de>; Tue,  7 May 2024 22:09:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A29951F25D5A
	for <lists+linux-next@lfdr.de>; Tue,  7 May 2024 20:09:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34AFC18734C;
	Tue,  7 May 2024 20:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YUErLruN"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 089C318734B;
	Tue,  7 May 2024 20:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715112437; cv=none; b=Vv/gAL/PNPXqKYDeKRr95vldQOzIFqwoliVaHyUPFb7oUdEO9K9QpRNFxy7EdoxBoSBEwoqf6+gIWXHZvuuO+R17bWHYqzNUCrVGbs44U14ItVlBX33ch06l2QS6SjD6SERhX5vrU+zWqhBHB7UJRB/aPxqcgDwwOT9K/2cnbW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715112437; c=relaxed/simple;
	bh=iouoE3NOSOWqeVXlFJuuPM3HYDT1sH9d1FLLf5+gr54=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=pGA7R4f2ofLYqQV3yVEsS3LSnBmBzT+w7VmH75Kh0ufpFOra3pVVrM14hWmQNhlMGpW0BISfosqeCTHqWURmCB66HJGj9IKhd2PlwdtyWr6sHu9Dz31lDAeiH3OJMlbDnBBiej1zdML6Os0WPHPl90DItQBs3wcmJSAFJQHNnhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YUErLruN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11177C2BBFC;
	Tue,  7 May 2024 20:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715112436;
	bh=iouoE3NOSOWqeVXlFJuuPM3HYDT1sH9d1FLLf5+gr54=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=YUErLruNSL+Ty3sAfCM3UPFRKHSkTY/WeokRS4GvJrYW5CGgMrcNTVr24VWAcKMNo
	 e1lyGc9BlMVd5rCv7m2jIka9XAryLjnWcRr0vI4lVEj/f4T68idq8DlUhEEw5Bhugk
	 XQdg3Nwc+B/PJyI2YXRydSIN6RTKwx+gutjoQb94w4wJxtX7glfLKOqQtWJMs+q0ND
	 EZdWMXRTJ7DpXxy3oExqrs+PV1IPQVJfUduvN6JY4GBJU0ldqluAwHilB4reb8TuCS
	 1/Vyh240Z0hFOV9LYt5A6KVa44B84Bcum3WNyralnsAT+Rt+N/IFkWn1XsX4OYXxOA
	 5GpI8CIZEKApg==
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 07 May 2024 23:07:13 +0300
Message-Id: <D13OM6OQ0QRS.SSJJRFNR92LJ@kernel.org>
Cc: "Jonathan Corbet" <corbet@lwn.net>, "James Bottomley"
 <James.Bottomley@HansenPartnership.com>, "Stephen Rothwell"
 <sfr@canb.auug.org.au>
Subject: Re: [PATCH] Documentation: tpm: Add TPM security docs toctree entry
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Bagas Sanjaya" <bagasdotme@gmail.com>, "Linux Documentation"
 <linux-doc@vger.kernel.org>, "Linux Kernel Mailing List"
 <linux-kernel@vger.kernel.org>, "Linux Next Mailing List"
 <linux-next@vger.kernel.org>
X-Mailer: aerc 0.17.0
References: <20240506105936.37073-1-bagasdotme@gmail.com>
In-Reply-To: <20240506105936.37073-1-bagasdotme@gmail.com>

On Mon May 6, 2024 at 1:59 PM EEST, Bagas Sanjaya wrote:
> Stephen Rothwell reports htmldocs warning when merging tpmdd tree for
> linux-next:
>
> Documentation/security/tpm/tpm-security.rst: WARNING: document isn't incl=
uded in any toctree
>
> Add toctree entry for TPM security docs to fix above warning.
>
> Fixes: ddfb3687c538 ("Documentation: add tpm-security.rst")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Closes: https://lore.kernel.org/linux-next/20240506162105.42ce2ff7@canb.a=
uug.org.au/
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
> ---
>  Documentation/security/tpm/index.rst | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/security/tpm/index.rst b/Documentation/securit=
y/tpm/index.rst
> index f27a17f60a9602..fa593d960040a9 100644
> --- a/Documentation/security/tpm/index.rst
> +++ b/Documentation/security/tpm/index.rst
> @@ -5,6 +5,7 @@ Trusted Platform Module documentation
>  .. toctree::
> =20
>     tpm_event_log
> +   tpm-security
>     tpm_tis
>     tpm_vtpm_proxy
>     xen-tpmfront
>
> base-commit: 152585665f0f6b89e67ed6d04c17b18d1f0f4077

Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>

I'll apply asap

BR, Jarkko

