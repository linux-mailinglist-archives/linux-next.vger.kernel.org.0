Return-Path: <linux-next+bounces-9371-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3DACABAB4
	for <lists+linux-next@lfdr.de>; Mon, 08 Dec 2025 00:16:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 34AE93002D6C
	for <lists+linux-next@lfdr.de>; Sun,  7 Dec 2025 23:15:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B7662C159C;
	Sun,  7 Dec 2025 23:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pdP1IOPS"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 582CA155C97
	for <linux-next@vger.kernel.org>; Sun,  7 Dec 2025 23:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765149357; cv=none; b=bY9YMPA1B7X22QkCD6OmiH/gmtrFrAnHUROmfVFNXj3tImiHrmC9aFHOWJFV9A4IVqutMf7eHA4hgZoSOLyQsur2StUzt6p8R84i26T76I3Rh027ZwEApYi5ve/lQSLhEuBVimMQzWPAiW57Z5zSRmF5XKh3VsDOgxP6eNeO6ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765149357; c=relaxed/simple;
	bh=JrawoIvD5t0mSOtoyYriDOG37dzck5mS9GT3TPZS81w=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=ByalMl3mKATOsb/mDBRDVwXA7wFh4RyNKMxDug1kXrp7ayusMGVknwoEx8NGLD1MxZs1vSRS2QjnTnmQwfhER2P6pzKP2EoHJhMyESw2k7RtW6sfayvv8z0rMAsHE76kVjAKohpisVjdCM24Ze5H/M4a1oR227cjy2UVW0hQtjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pdP1IOPS; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-42b38693c4dso1782636f8f.3
        for <linux-next@vger.kernel.org>; Sun, 07 Dec 2025 15:15:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765149354; x=1765754154; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JrawoIvD5t0mSOtoyYriDOG37dzck5mS9GT3TPZS81w=;
        b=pdP1IOPSL8KY3IxDXkN4DeLPaWDErmLm++ZI+K2V3F+iMdk+9svTMBxzeqVufMDb4c
         VqS0L7/Isr8sWDqpKcmaZJ7jqmS1XHlXUnKWDTVHd2TyLKYqz2PCy83D4GPHMZV/52Df
         HjF3Hv1rTIWM3HSXELgBZWu/XQgNv95rW/QizddCHo9oxvDXmrX+KDc4I4CeH9tdnwSC
         SMZErt8fRPdW5UsPGNwjLL5Npe+jLhhhnz45DcBDgS8StOECkK4HH9n8EliAj7JApJwq
         N/ukRV+Lm/XWSRpWGFBGggtyd7zPcECJ7eQHAhruKBpMZD0NvHoT+wk/yLkWZkMj9e4r
         y5pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765149354; x=1765754154;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JrawoIvD5t0mSOtoyYriDOG37dzck5mS9GT3TPZS81w=;
        b=vVrXBl/J+43jHrG6C/ksiMZmPC0VgLD0u/m9x+FM6ZJMTAp8dinH8KLGSE4ownjUPk
         vddHLtJtSb108TJ4UntFlQ5HAdrRIrD8dGkTZrkIMp7dSHIKZCQ+MoD4fA8tc+uS8KAU
         NNRMi36hd6OZgNZLHUvhAoyaI73tBFZZAl7jVd8TFLcdByMjdc8TFEYA7Q7i4qzf+YO4
         SUTVjoEkRazFmVQuNpUNNzS1fKa9HaNIfca6yIc4msSc4IhYj9itTZfJRiJAwV4vHWsg
         bSbZg0bszoAnUzwulWa0S6bclB2uC7X81+dcEgRQEijSw9oKj1b/pkTiexvreDebuv+e
         aZOg==
X-Forwarded-Encrypted: i=1; AJvYcCV594GIGpPIz+34bJJALepKkPJRtB8WwojzD0zsGowTLL280/7lJP5EzovB+d5Me7JAWBM0PlIkVmW1@vger.kernel.org
X-Gm-Message-State: AOJu0YxWh3p5hF4QJVy9LR4l1f3dJDO1Fb8VP1VxrVnXZqAtOila7cJZ
	/R+GsMhTzj2xKeO4NZaZqJBeac+iqvsX2MeEeWnltJdWuDlRm5BQz2XdE9whrb4Ckts=
X-Gm-Gg: ASbGncvKmArxeoXZYeUVHi6zTVkKXyNCXLyXufKb5idxt6NYlVPdHcbFOAjGolJ4rle
	KXVRVbHLqZY6gtpyPEtLhsUpBpJMEdHyHFAApCIhvcxLqkIQCgagulhskFvOJbOPrVojGfSoQHr
	r3Yyx9eIswqeW/hyS3kupttHSDmm36X+X+pCxre+rFdeRvVBaCx5oKwaWUeQ+YhqGGxgTdUm7gB
	CLCjK2rWmkSvuKaC07GtX+TABRkaJtIwIEh+NbJIFYx+GTO7GLGSolgOdXWrreCWKggv21UETCN
	B+qaEpX5Ju0j228kc/sXUPl21q4/s6/7h+b3sSdL2Y5QD5YfrFlQwYtIyAyLpjakYE4nXLZ8yQe
	/bbJ0QxWpk5H/oF2B0P/pzCqeQqcwiTDIL3tT5rim/H0w2I9ORZsHx446bmL5Q+dO3m4chsd/ll
	sx7TLEuo5DKIDfrCX1
X-Google-Smtp-Source: AGHT+IG265bGsuH8yFF78i9r8fah0BbcyblFqGg1lC2v8CBn3ElR0sMxydVKkkvoEWSpFSE0ekKljA==
X-Received: by 2002:a05:6000:1a85:b0:42b:40b5:e64c with SMTP id ffacd0b85a97d-42f89f6340dmr5988631f8f.30.1765149353630;
        Sun, 07 Dec 2025 15:15:53 -0800 (PST)
Received: from localhost ([2a02:c7c:5e34:8000:da07:24c6:f91a:9817])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7d222478sm21783666f8f.20.2025.12.07.15.15.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Dec 2025 15:15:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 07 Dec 2025 23:15:51 +0000
Message-Id: <DESD81PA9NI9.NKA6IOV0ROX9@linaro.org>
Subject: Re: [linux-next] potential deadlock in ufshcd?
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Bart Van Assche" <bvanassche@acm.org>, <linux-scsi@vger.kernel.org>,
 <mani@kernel.org>, <linux-arm-msm@vger.kernel.org>
Cc: <alim.akhtar@samsung.com>, <avri.altman@wdc.com>,
 <linux-next@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.0
References: <DERQ2FF2WO70.3I04I9XAG5V6D@linaro.org>
 <46cf2cb9-76f4-4d73-be3d-88fcbe7055f4@acm.org>
In-Reply-To: <46cf2cb9-76f4-4d73-be3d-88fcbe7055f4@acm.org>

On Sun Dec 7, 2025 at 3:18 PM GMT, Bart Van Assche wrote:
> On 12/6/25 7:07 PM, Alexey Klimov wrote:
>> Is it a known problem? I can test potential changes to resolve this
>> or try to collect more debug data if needed.
>
> Please help with testing these two kernel patches:
> * "[PATCH] ufs: core: Fix a deadlock in the frequency scaling code"
> (https://lore.kernel.org/linux-scsi/20251204181548.1006696-1-bvanassche@a=
cm.org/).

Thanks! This looks like that one about fixing deadlock does
the job. I provided tested-by tag there.

> * "[PATCH] ufs: core: Fix an error handler crash"
> (https://lore.kernel.org/linux-scsi/20251204170457.994851-1-bvanassche@ac=
m.org/).

I didn't test this one yet though.

Best regards,
Alexey

