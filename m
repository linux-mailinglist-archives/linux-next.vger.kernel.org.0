Return-Path: <linux-next+bounces-2609-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A629106DD
	for <lists+linux-next@lfdr.de>; Thu, 20 Jun 2024 15:55:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5139428236B
	for <lists+linux-next@lfdr.de>; Thu, 20 Jun 2024 13:55:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F9E01AC782;
	Thu, 20 Jun 2024 13:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I6sOW3mg"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 081817C6C9;
	Thu, 20 Jun 2024 13:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718891747; cv=none; b=rdtkW30eOyGoaP9znFyvpP99nxpLXmTPdPJCIWRJANRDUySkXg26kWTeTlKmbffCIRt/K74AMjO/E/doaNVl0UHzv0V3dxeRKHJdZ/qIsJr/qNjsPTBk8rZuVHvkhd9LKjSXAHW7TA/vQvSt9MyVrULRRI9MVINqCPwCJPWJz6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718891747; c=relaxed/simple;
	bh=FQ35d6XFImkpLOx8YRtSzgdJkETVQ26hDWZbbxXGWD4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KNTD7LhmWK0xpZITpu7iuFxJbY3KRR/A2Rl+JtpGrMHcdYTL3/jG9F+hPxFG8kvjFg6JxgqWs2TOI++EQk6IT3Hu5PrLRLnToNScEonw4devfUKeV1M+3e6GGsL4D1GEqD/o46OwYk70DMl+cMJpEIL4vZhUYLG4IiuT+0hOzKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I6sOW3mg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CBB9C2BD10;
	Thu, 20 Jun 2024 13:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718891746;
	bh=FQ35d6XFImkpLOx8YRtSzgdJkETVQ26hDWZbbxXGWD4=;
	h=Date:From:To:Cc:Subject:From;
	b=I6sOW3mg/5BWz7ndIgS+erEgMjwKcEl95cmTRRZ1RTpQNnhWlDc+QHwb/OBGsXA0c
	 Sec5AiZM0gMdBGqXOtoo7jiaRfzkFfk3zZ91YJ+ddLM6uGJyhZs2EtBbDsWpBY3Owk
	 CPmYV3PzpYLQ0YfdzuSjW8OCg37t0cfkrmXq2FRs5ZxvPO0FHvozV7uah1zTutmvBe
	 2Lbl1qOavWh198Ul2RNZkYOhP9XEnMO2KB5yY0r7WIwN6n8AGoaiOB64wjvk6dXZgw
	 D4ESiMUxQEdKvuAHUWuKBirQyv+nOoTkUb0haoNRdh4OJIlVyBYp3r46CtJvmrfGBj
	 0esHxxi0MNCmA==
Date: Thu, 20 Jun 2024 14:55:42 +0100
From: Mark Brown <broonie@kernel.org>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	"Luke D. Jones" <luke@ljones.dev>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the hid tree
Message-ID: <ZnQ03jc-xEWam2cR@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0Cv0fqiY7NNCbfaz"
Content-Disposition: inline


--0Cv0fqiY7NNCbfaz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the hid tree, today's linux-next build (x86 allmodconfig)
failed like this:

/tmp/next/build/include/linux/platform_data/x86/asus-wmi.h:174:64: error: missing braces around initializer [-Werror=missing-braces]
  174 | static const struct dmi_system_id asus_use_hid_led_dmi_ids[] = {
      |                                                                ^
cc1: all warnings being treated as errors

Caused by commit

  bda38f9a41d89b ("HID: asus: use hid for brightness control on keyboard")

I used the tree from yesterday instead.

--0Cv0fqiY7NNCbfaz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZ0NN0ACgkQJNaLcl1U
h9CPYgf9GUR3MdazRRcNsjFarCZupj+HJr9hcFu3ELiZVSCXo8QpDV569ozSkXNd
1gd6ff1uqyopDhU9p6S0bYjHRXma2M4svuwtUXOEFlauQJ5PqGiCxAthO/KoHYKk
I6SfxUgOuwmt7U/K66EiL5/O00FHW1nE8aPB10csRhOFA8DKySkwWQRXC+W25Om9
P81GNi0Ex49hIGUbXcE8mnQsnl3J26Ph/6yvRxOndVMRhLr+dFDR0ZdsyGyDK9sw
W0502glrQvZ7fRFXXaffDSMQPA+fn+qpSVV1nl134LH26RIkcNpKi21FVneUOcu+
g0o10nTpLOXlzB7moZKhDeL0dQf/Ww==
=zADj
-----END PGP SIGNATURE-----

--0Cv0fqiY7NNCbfaz--

