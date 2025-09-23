Return-Path: <linux-next+bounces-8459-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A77B9B97EDF
	for <lists+linux-next@lfdr.de>; Wed, 24 Sep 2025 02:44:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C1E037A5C10
	for <lists+linux-next@lfdr.de>; Wed, 24 Sep 2025 00:42:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE9B71C8630;
	Wed, 24 Sep 2025 00:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=maguitec.com.mx header.i=@maguitec.com.mx header.b="VE/OW4mG"
X-Original-To: linux-next@vger.kernel.org
Received: from sender4-g3-154.zohomail360.com (sender4-g3-154.zohomail360.com [136.143.188.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447BE1BC9E2
	for <linux-next@vger.kernel.org>; Wed, 24 Sep 2025 00:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.154
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758674645; cv=pass; b=XaeOepDKvlzyPezedn1CAdUEy1wXHumep9dYQGy02hkgaBq9pvxeNOx8dS3EA5jGWTHGJEgmGilS9476mBfmJAMiqGUCowg3cJtiLcH9zJoE2k/CEEQW4Lcf5zMLSt0jO0NTWde3zEcyb7qqhSKWO//jJgGML1PsNS5FHLzrxmQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758674645; c=relaxed/simple;
	bh=iS0CcH3oVe74c9s1DFSOuahHkpXyBCIeRlouZFq6JRc=;
	h=Date:From:To:Message-ID:Subject:MIME-Version:Content-Type; b=Ms64erFUSt6C88ZKjCrBgyOXu9fBSKtTndNZDJ/Vz1NgpjIS39L0hf6rrDlRIOKRj3Gr4WV/rlrjTJyi4S4fB3ZGp3JYT3UB20zUaIFgKkNLpXJuTFxFlWV6DnrEntFWAwj/MW8YQlg14QPqr3YBqH4KOY0nNfD9RaWdj4qdwGk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=maguitec.com.mx; spf=pass smtp.mailfrom=bounce-zem.maguitec.com.mx; dkim=pass (1024-bit key) header.d=maguitec.com.mx header.i=@maguitec.com.mx header.b=VE/OW4mG; arc=pass smtp.client-ip=136.143.188.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=maguitec.com.mx
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bounce-zem.maguitec.com.mx
ARC-Seal: i=1; a=rsa-sha256; t=1758674643; cv=none; 
	d=us.zohomail360.com; s=zohoarc; 
	b=ObH12pM7h03eFHPJB0CpYN5+5mfLpoW488uWAw2L++FAUVuLkBYhrIfkGDsvT8AIB7Ab3zTyO9Ec0PK4o9LOhiBkFBjZPSDfRPrSasWI97xCF/j646jHtw+6RxaLYsUWbImbeKWRYxHqJtJ8G5ntH7fUVVEfW9GMB+QlMS2RT28=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=us.zohomail360.com; s=zohoarc; 
	t=1758674643; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:MIME-Version:Message-ID:Reply-To:Reply-To:Subject:Subject:To:To:Message-Id:Cc; 
	bh=iS0CcH3oVe74c9s1DFSOuahHkpXyBCIeRlouZFq6JRc=; 
	b=cKtVdrUO031eWR1QeZ8CVdW8g8EHD/UdxaZF9z8njOjbEsLcD40QRMkzf76zJPb3owifKgBq/2x48JZjZA0TAO/zD3E4/GNQ8R66+fhb04xijCj2LZV0lHD4+1W+P1wXd3gkLhtevix4qZNXBgAu/X22Vz6+J8Jid18P7c9E0Qw=
ARC-Authentication-Results: i=1; mx.us.zohomail360.com;
	dkim=pass  header.i=maguitec.com.mx;
	spf=pass  smtp.mailfrom=investorrelations+9a968900-98d8-11f0-8217-5254007ea3ec_vt1@bounce-zem.maguitec.com.mx;
	dmarc=pass header.from=<investorrelations@maguitec.com.mx>
Received: by mx.zohomail.com with SMTPS id 1758671653437426.6080034341037;
	Tue, 23 Sep 2025 16:54:13 -0700 (PDT)
DKIM-Signature: a=rsa-sha256; b=VE/OW4mGKVisRsSS5Ag7Bwt7n7ukhTSjoOTzw04xA1kTwON/jaU5HszGlZgNiAmlr+Qoy9x7CnfAavlBY7tohMPhr+FsI21rM3vSisqrY6CNatzLYMDs7keZE42sdKaR0ngoqj/Uc2jhRt4qph4ywAMXkjAHLovUxXlymOclXCc=; c=relaxed/relaxed; s=15205840; d=maguitec.com.mx; v=1; bh=iS0CcH3oVe74c9s1DFSOuahHkpXyBCIeRlouZFq6JRc=; h=date:from:reply-to:to:message-id:subject:mime-version:content-type:content-transfer-encoding:date:from:reply-to:to:message-id:subject;
Date: Tue, 23 Sep 2025 16:54:13 -0700 (PDT)
From: Al Sayyid Sultan <investorrelations@maguitec.com.mx>
Reply-To: investorrelations@alhaitham-investment.ae
To: linux-next@vger.kernel.org
Message-ID: <2d6f.1aedd99b146bc1ac.m1.9a968900-98d8-11f0-8217-5254007ea3ec.19978ffc590@bounce-zem.maguitec.com.mx>
Subject: Thematic Funds Letter Of Intent
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
content-transfer-encoding-Orig: quoted-printable
content-type-Orig: text/plain;\r\n\tcharset="utf-8"
Original-Envelope-Id: 2d6f.1aedd99b146bc1ac.m1.9a968900-98d8-11f0-8217-5254007ea3ec.19978ffc590
X-JID: 2d6f.1aedd99b146bc1ac.s1.9a968900-98d8-11f0-8217-5254007ea3ec.19978ffc590
TM-MAIL-JID: 2d6f.1aedd99b146bc1ac.m1.9a968900-98d8-11f0-8217-5254007ea3ec.19978ffc590
X-App-Message-ID: 2d6f.1aedd99b146bc1ac.m1.9a968900-98d8-11f0-8217-5254007ea3ec.19978ffc590
X-Report-Abuse: <abuse+2d6f.1aedd99b146bc1ac.m1.9a968900-98d8-11f0-8217-5254007ea3ec.19978ffc590@zeptomail.com>
X-ZohoMailClient: External

To: linux-next@vger.kernel.org
Date: 24-09-2025
Thematic Funds Letter Of Intent

It's a pleasure to connect with you

Having been referred to your investment by my team, we would be=20
honored to review your available investment projects for onward=20
referral to my principal investors who can allocate capital for=20
the financing of it.

kindly advise at your convenience

Best Regards,

Respectfully,
Al Sayyid Sultan Yarub Al Busaidi
Director

