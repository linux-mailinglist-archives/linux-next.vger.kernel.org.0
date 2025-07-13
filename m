Return-Path: <linux-next+bounces-7504-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 255FDB03115
	for <lists+linux-next@lfdr.de>; Sun, 13 Jul 2025 15:16:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7D7133AD162
	for <lists+linux-next@lfdr.de>; Sun, 13 Jul 2025 13:16:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D4341078F;
	Sun, 13 Jul 2025 13:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ULnlX0DF"
X-Original-To: linux-next@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E898133E1
	for <linux-next@vger.kernel.org>; Sun, 13 Jul 2025 13:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752412605; cv=none; b=MM2m8A81WVh5CR9kXXVV/1NjuCY0XIOeIf4+IssiZDTkSE8PApeWtdEOynL8+xzndNAQRDgM+7Hsc6m8kHYagfAcdc7+Z6YoKx+9nliD+KwVT9Fg/Yp5j0HjAH1qJ/YUf/HS0X69Z9A/io0fTvoSwU1zqVIcfsNSAE3ThwehML8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752412605; c=relaxed/simple;
	bh=bQRf+gZrYzxxj6RxPTQT/0OmyL+eq9kkMld0hhhnwXY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E50uoIIwlKlrgcXqp+I7O/nSQ6zcFhgoEkkCFnc2e1RUEmS3HIf7HIc6wKqW/KLKXCXZCDDdX9T9OaHoO9w5pArqBU/kf/HxgPLkMOIJTWFp3Xzu/4iVsWayyAB7yWwJw6hIF8Q1VHFcAzhUQ25k/SPvgcD4RI0pWPiGo2MX8Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ULnlX0DF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56D9jHJq028028
	for <linux-next@vger.kernel.org>; Sun, 13 Jul 2025 13:16:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=bTUx+VZ4YLVbV9D1AWkOK6pRuT0f7GMSlVwY3D452HQ=; b=UL
	nlX0DF5b+61nX7zTfN7F5d7ks+Plznjmaf/qz74NyHN2wQ5nyRAShZ9pAlPxsjQ6
	fbiHuCTENTFtvOZE05onoO1ePrwO7965IAKw6FFPIwlA337NwfZJG1/IFuX2w6t5
	+ONrzCTcK3rQ8S7jadlmYot6db5h3UpdXPjTYErRUF6Z+jHJY4DWhPhUupuXBl5X
	qBVCSewMyPU2IHCgM2ylBfK2XERhWJLGDEE7z9srf+gIubKagQ5bTMVUqMo9J8mB
	LoR95awqTj6LgyHJiZfujgYRoAXCihgStegcXdpO5u1CzCCWzj0ymJpw4PFXjpGg
	bCwZUeMxePFY3bHrQV/A==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47v56a0m3w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-next@vger.kernel.org>; Sun, 13 Jul 2025 13:16:43 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-40b0096024eso4013202b6e.0
        for <linux-next@vger.kernel.org>; Sun, 13 Jul 2025 06:16:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752412602; x=1753017402;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bTUx+VZ4YLVbV9D1AWkOK6pRuT0f7GMSlVwY3D452HQ=;
        b=sZdFS9V98/rHAp9fvMhlSK5jDTf3bRXPa/egIkGVF7/6u3OH7tRxJaqyne1dvjqlvH
         RgFQeujBb5jDY4plI29hFPPTn6705vaKjZN4o3zcR0HKBZHLsHeRYtV+QSII2/aIpyD3
         hyE9iMr//jykLnKR24UD+2v+cyy+1LUMYzkihsZ/3FrwTtdEwOcUBUqer2YN7cU6rYPA
         b/mbNU4OY465vWJdSvRjo9CyrKY+LIanPChCT5BdoKChLdL+bI6cm2/d7okdwZPbinpR
         7xFZiJP+ldX4VhWXbM8kl+TgSu0HL8oxWCgjg/nB9YFDWV/NpqRVXK3oadd7klaFTC3J
         6L0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVjxOwfPGwhqonH41dHfO6I24mAj3ZlkVKoMZUjP1sGspHJOyeQtyey44e3FXjbEAhJYXrXf/rtmgpk@vger.kernel.org
X-Gm-Message-State: AOJu0YwCbKYgW4F13/ucz3dIFVRLVoy+LeMjHzwLC5s4kvd/ExZXxH/F
	y6VwWwsXIUVXpQIonkGGPiHwCpl9OXfmf6w7xeJprl28qiVWe08fnl5lyKrlObX//rrE0kQFxFY
	caWE8shXgcfyck65Pr2KW/Z5V/PYhJdvQKxalnW1GspQytbw9Mh6GjiBJqvjR59JToFCXYLKhZY
	ybFac2HgTJVRb9gsgVdkSqB6mb7EeL0PuSMPGmbwgVnFmtZBxTeg==
X-Gm-Gg: ASbGnctP1cv971BAaBmMbU0uYJlcXPug7Pk8+cz6zObwOsD0r17anfXrgOVk912SJdT
	N2605p0esu3qPkObtKRJMMtSQOZYU8KMc16vEKpiP1ecpYpLiBehDRKOlldRJo+IHiUBwmP6oiG
	y0QLeNI8Dl7abjyJ7CQV+5MwuPhnvebk9NzCjA2idIEXLTAsNnYAqA
X-Received: by 2002:a05:6808:23cd:b0:404:dbf3:5b0d with SMTP id 5614622812f47-4151d5914e7mr6575396b6e.3.1752412601964;
        Sun, 13 Jul 2025 06:16:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1VaQK9wqnz+FxTANYpJ62FB5qEMASGOmEnkAQmxm/t7Rjz3H1kfZoKlFbnHST+MqaPlzvrU9rnDXUzvdkudo=
X-Received: by 2002:a05:6808:23cd:b0:404:dbf3:5b0d with SMTP id
 5614622812f47-4151d5914e7mr6575381b6e.3.1752412601552; Sun, 13 Jul 2025
 06:16:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250711191014.12a64210@canb.auug.org.au> <e744987a-2fed-4780-a9c6-fd1175698da8@infradead.org>
In-Reply-To: <e744987a-2fed-4780-a9c6-fd1175698da8@infradead.org>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Sun, 13 Jul 2025 06:16:30 -0700
X-Gm-Features: Ac12FXzFPCGagOTtBoMZgRaN1L0GwHmRIThJgFjwywyiNvm8JhFCpXjsqSe1SlY
Message-ID: <CACSVV011qEHt5Srx4QdP5=L9WqxTg9yjY63rTUGwbXawq899gQ@mail.gmail.com>
Subject: Re: linux-next: Tree for Jul 11 (drivers/gpu/drm/msm/msm_gem.c)
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux DRI Development <dri-devel@lists.freedesktop.org>,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: FpO6ukGDSkN-iUCfjX5_NaryW_WGnYVw
X-Authority-Analysis: v=2.4 cv=X7BSKHTe c=1 sm=1 tr=0 ts=6873b1bb cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=JfrnYn6hAAAA:8 a=PbJyB38NimUM2AyV3J8A:9
 a=QEXdDO2ut3YA:10 a=TPnrazJqx2CeVZ-ItzZ-:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: FpO6ukGDSkN-iUCfjX5_NaryW_WGnYVw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEzMDA5MiBTYWx0ZWRfXyHc6RDRXWz+f
 iJoMwfCff2vxPP41WGI9F2j/cTnmhABLsFjrQFsAFAlB37PDgrxK8O9tj9onGfm1HQMC9aGtdhz
 J0K7KyxHvJ1LQCtvVmIprQa6bUOFQB9NSDVlzvg+u0IR0Jyo7PDMnZHb0SPuh2rQ+zJfsWWNImP
 kgIpEgXRiDkP3AIzMzXG5xJ02I2jZvsqNp8hWz3zbU4v3dPI0i+JppobMwH8rLzCw5H2xPFAKyd
 vlaK3chF0zJoNPgMOceXL019yKVqvD+M80bAV7LXOyY6tgwlmi3PwtQN3R7GsyzrL2qQsnGg5sj
 Zguizli/52YPemMfPK6f7twNK/h0aeyZIvThjevXp8+Fe+JgiNnlVydODOk+cI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-13_01,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 mlxscore=0 mlxlogscore=999
 suspectscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 classifier=spam
 authscore=0 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507130092

On Sat, Jul 12, 2025 at 11:49=E2=80=AFPM Randy Dunlap <rdunlap@infradead.or=
g> wrote:
>
>
>
> On 7/11/25 2:10 AM, Stephen Rothwell wrote:
> > Hi all,
> >
> > Changes since 20250710:
>
> on i386, when:
>
> CONFIG_DRM_MSM=3Dy
> CONFIG_DRM_MSM_GPU_STATE=3Dy
> CONFIG_DRM_MSM_GPU_SUDO=3Dy
> # CONFIG_DRM_MSM_VALIDATE_XML is not set
> # CONFIG_DRM_MSM_MDP4 is not set
> # CONFIG_DRM_MSM_MDP5 is not set
> # CONFIG_DRM_MSM_DPU is not set
>
> so DRM_MSM_KMS is also not set:
>
> ../drivers/gpu/drm/msm/msm_gem.c: In function =E2=80=98msm_gem_vma_put=E2=
=80=99:
> ../drivers/gpu/drm/msm/msm_gem.c:106:54: error: invalid use of undefined =
type =E2=80=98struct msm_kms=E2=80=99
>   106 |         msm_gem_lock_vm_and_obj(&exec, obj, priv->kms->vm);
>       |                                                      ^~
> ../drivers/gpu/drm/msm/msm_gem.c:107:39: error: invalid use of undefined =
type =E2=80=98struct msm_kms=E2=80=99
>   107 |         put_iova_spaces(obj, priv->kms->vm, true, "vma_put");
>       |                                       ^~
> ../drivers/gpu/drm/msm/msm_gem.c: In function =E2=80=98is_kms_vm=E2=80=99=
:
> ../drivers/gpu/drm/msm/msm_gem.c:668:39: error: invalid use of undefined =
type =E2=80=98struct msm_kms=E2=80=99
>   668 |         return priv->kms && (priv->kms->vm =3D=3D vm);
>       |                                       ^~
>
> --
> ~Randy
>

fixed by https://lore.kernel.org/all/20250709140838.144599-1-robin.clark@os=
s.qualcomm.com/

BR,
-R

