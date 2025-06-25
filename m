Return-Path: <linux-next+bounces-7246-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0AF9AE787C
	for <lists+linux-next@lfdr.de>; Wed, 25 Jun 2025 09:26:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 80E583B901D
	for <lists+linux-next@lfdr.de>; Wed, 25 Jun 2025 07:25:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F32421FC7CA;
	Wed, 25 Jun 2025 07:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KJjRrXXS"
X-Original-To: linux-next@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A72C1FF7B4
	for <linux-next@vger.kernel.org>; Wed, 25 Jun 2025 07:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750836301; cv=none; b=XYfjToQ7ctWPPwpq9FskEaTnaCwdULvNM79MKJ115DPPOiGN2xyp2iXKHZg04T+ZUIDeAhvIj6aoIFqB1P1C9ez8Z3A6cZ6DbE9xXxLwubyOowAqubjyglcTqFYfRE2T7Tmk+5TNAAbeDeHqe4wZWTSZaZ2mwTLg44fM7BizH1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750836301; c=relaxed/simple;
	bh=ce1UdDUU7h2aNFOM8myKE4XHFYi78SBsoNdAnOZm/JA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NvCCsIkCWrm6CZqTCIl2MQqikpKfBdjYib5GZGy1Ef6ciqj6Im7EOY36KpBbt1VQeiKuiiYFTkKrZ1mQP6VT/vE/kgU6k1cQVVfjNVPM6HqJymbNkJbYx1ByqVtyWEa0GnL5+GgbztauaUHPTB1GczRDYDfXJOT7yWanRX5p0KM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KJjRrXXS; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750836299;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gb1EG5rVAzkyLlYvRtxAnYGAwdctzybaq8suJ9itpCc=;
	b=KJjRrXXSMGwKLrTExr0tE0zU6/ZXzbKAU+kDoG5KwPBar136w1R2IbguvjxnobgmLmYzEk
	mN9ZvuJ1eC67gh2Jm3n5FNR7CYPw89XA2gAuRcJbxdonSEgI6iWablS6EC/7k1iWiEUizo
	JDG+w1iZKXTJBRnSaBHPZwAyCcGgm/c=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-461-4DpfPkL7MIe7tswPhcknSw-1; Wed, 25 Jun 2025 03:24:55 -0400
X-MC-Unique: 4DpfPkL7MIe7tswPhcknSw-1
X-Mimecast-MFC-AGG-ID: 4DpfPkL7MIe7tswPhcknSw_1750836294
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a4f6ba526eso3857949f8f.1
        for <linux-next@vger.kernel.org>; Wed, 25 Jun 2025 00:24:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750836294; x=1751441094;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gb1EG5rVAzkyLlYvRtxAnYGAwdctzybaq8suJ9itpCc=;
        b=b9sYQkvI2idLY5HhKbXH6r1Vzi3CLUH9AI1YP28HDchzxllDKkkRcLXXncEqT7RxdH
         cFIcXjDQhFGCRwne+U9ClPm0Uv0mMlbCRFLQ662qDjwipxotMNphVs9YYuTYOQqnscY6
         tPiM+dGWA55SDlgbjbomDrO/DVmr5KlaAiFwXXyJo95UyhVg3ULXew39gkf4mWFq9PFV
         v5/kQKRhSffotU2zxCZlDcPiSPIPweV+Lga4HaiM/D15Q3PyOvnFURA1FjCqGwUWsY52
         ErWwvJgtnbrqcpMvcgl8bs9BZNDjnIPcBYWom4cp7xqWOpfUfNeti7OBRUqBh+6zRIqV
         +qmA==
X-Forwarded-Encrypted: i=1; AJvYcCXMwmphemnOIdJTklQ6DCsdQleihi0KU3R1G+eGNl9Ml0Urc+kWNIPJ/C6qQv8uIz00B54G0dDBR3ud@vger.kernel.org
X-Gm-Message-State: AOJu0YzIMKAcdDiywaYUBqu+meEIue4DkBJQHuMckdyJCoWlHh9LwCMj
	xJYQb/uiHYv0tN3Fqf0w0jYiVH6xXdd+ODD3FdD1w69cGDU5rnrTG8nkptLAZ2ZgV0VKAqZpqCZ
	il22vXLEf0fdmLXnwhgZxgDgREHGkc++RtTjsLdY5xuYnSiluVUaqTyf7iYhcT5Y=
X-Gm-Gg: ASbGnctzThcGM3MjJReEJ28ynE9j4eLhA7LH08dU+4WzRAaofnXcx6Epr+Qhys0J3Nw
	zTOeA30Ol7PrCq4yImiF4juHv/C9jIW7HdeSrfKrnViDPtZjcBsIEChjFZ/80Q+MPig18ajHDAm
	jyhThz6Kmpqa2Nxuxog9yh8P1TDeTqs9W8zgLylDJkat6oZZkYC7UUqObq0PVzPrxnxp1GXCam8
	CkQ7xddRTK6Di4eCqY+o+EY5ZgK1n7agaN7+QRedNozkt5lQttDyb83CcxGmHGMIpPvrsSQCvdG
	KmzK8RAryr7DAn23PPXB7bMGibWBM/UciRmIjcQm/UmH5uuv4vCo+EysEbcCefEz85c+jA==
X-Received: by 2002:a05:6000:4815:b0:3a4:dc42:a0ac with SMTP id ffacd0b85a97d-3a6ed64e5ddmr1223626f8f.49.1750836294085;
        Wed, 25 Jun 2025 00:24:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFA5cKazsGi7+isNP4cFmVJmrA4j/6038eVM8NMzh2KqkWk8sKK482rCdusN3KvxTYpOH6e0g==
X-Received: by 2002:a05:6000:4815:b0:3a4:dc42:a0ac with SMTP id ffacd0b85a97d-3a6ed64e5ddmr1223598f8f.49.1750836293687;
        Wed, 25 Jun 2025 00:24:53 -0700 (PDT)
Received: from ?IPV6:2a0d:3341:cc86:3510:2b4a:1654:ed63:3802? ([2a0d:3341:cc86:3510:2b4a:1654:ed63:3802])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e805e828sm3894469f8f.32.2025.06.25.00.24.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 00:24:53 -0700 (PDT)
Message-ID: <81a216e8-e675-4564-84bb-039e0851a8ec@redhat.com>
Date: Wed, 25 Jun 2025 09:24:52 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: duplicate patches in the bluetooth tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Marcel Holtmann <marcel@holtmann.org>,
 Johan Hedberg <johan.hedberg@gmail.com>, David Miller <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Networking <netdev@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250625111648.54026af1@canb.auug.org.au>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250625111648.54026af1@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 6/25/25 3:16 AM, Stephen Rothwell wrote:
> The following commits are also in the net tree as different commits
> (but the same patches):
> 
>   4500d2e8da07 ("Bluetooth: hci_core: Fix use-after-free in vhci_flush()")
>   6c31dab4ff1e ("driver: bluetooth: hci_qca:fix unable to load the BT driver")
>   d5c2d5e0f1d3 ("Bluetooth: L2CAP: Fix L2CAP MTU negotiation")
>   866fd57640ce ("Bluetooth: btintel_pcie: Fix potential race condition in firmware download")
> 
> These are commits
> 
>   1d6123102e9f ("Bluetooth: hci_core: Fix use-after-free in vhci_flush()")
>   db0ff7e15923 ("driver: bluetooth: hci_qca:fix unable to load the BT driver")
>   042bb9603c44 ("Bluetooth: L2CAP: Fix L2CAP MTU negotiation")
>   89a33de31494 ("Bluetooth: btintel_pcie: Fix potential race condition in firmware download")
> 
> in the net tree.

I think it's an artifact of the BT tree being rebased. I pulled from:

git://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth.git
tags/for-net-2025-06-23

It looks like the first set of commits is no more reachable in the bt
tree, so the 'net' ones should be the "correct" commits set. @Luiz:
could you please confirm?

Thanks,

Paolo



