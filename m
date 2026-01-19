Return-Path: <linux-next+bounces-9730-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F059D3BB88
	for <lists+linux-next@lfdr.de>; Tue, 20 Jan 2026 00:09:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 501D23027820
	for <lists+linux-next@lfdr.de>; Mon, 19 Jan 2026 23:09:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9651F1DFD96;
	Mon, 19 Jan 2026 23:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="myg/cbjP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="URkM46bz"
X-Original-To: linux-next@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B291B142D
	for <linux-next@vger.kernel.org>; Mon, 19 Jan 2026 23:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768864182; cv=none; b=GILhqtxA/mBR9imD2HurZWMX13lCME/GHdp9nmrU2LQ7YkBVBgxLM+kVwqRblO047G+09tv730UIzNrJbOsNFiIVGjEz0G52FLvk/saAX6qfFj+IyFoquEAY+VApvI4WfOTK8z8N3AD3wJ2SERLN6Caut939JkTFGyCeWtp9SWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768864182; c=relaxed/simple;
	bh=+geog84B6P331HpwcgIW7RIAEFF/z0C32En5HwiWdDk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rR4HZGjD+FnnoSPgICI9Ae6R0qV69bCPn4e4RcRMLzsMHp3ahDJVHZAkAOUP5dLWGZsu/VMWfg8Dlm8QL4FQP9HyQsE46ukkWIK3AQqNYVlL4Lzmq8Cri28pz3R4wrhyB4wJnk8fC876jZWBPmVL9ReY+3iehmVMBth3nvDrdfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=myg/cbjP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=URkM46bz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60JHxUaL774894
	for <linux-next@vger.kernel.org>; Mon, 19 Jan 2026 23:09:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=y7pTPfUH6iVzqZGYdTEFNi2K
	I6ZRLfJ8c6TQ1mSDQ68=; b=myg/cbjPvoXM6VUgMkCT6HnLHMrhpB5Z096hKCnQ
	P+LihECyI+10WkWLhns7DQP5Ctnfivr7GBZn7ZGmaebgZ6kqarQGjBYHz41HGfWt
	1nfoIHg721ELeXWhg7v3mXPT2gKhrD1mRFvvhJ4OV3+wdbRxKNWbtc2IkOOt4g/V
	6tkvhZWzvUQf6J2mAGab/7P0gszsTDXUQxjYi04sIHhP67GsPsYBOHEkuOXZ8w7E
	G0ntrrCOlws3JegwM3SgtuRjagHqNTd4NMmUXgpo3Rb8i0EP0sTE+s8xuLPJzBYs
	XbboYxkqn74CQ8F+lasKY6HSyxnnG4098Y+CXKycliW3Bw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsj9aa0af-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-next@vger.kernel.org>; Mon, 19 Jan 2026 23:09:40 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89463017976so962826d6.2
        for <linux-next@vger.kernel.org>; Mon, 19 Jan 2026 15:09:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768864179; x=1769468979; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y7pTPfUH6iVzqZGYdTEFNi2KI6ZRLfJ8c6TQ1mSDQ68=;
        b=URkM46bzWPmhAiPEDkZe295QOgjRvEB92Vvxg1Q6TR9a1IFehTwT/IiI1XjmLOcdTX
         Rhtl71b4q+9oQ/U3TkeFKbYbUTKHkJtAXkLC1P5um1haHkMy+9DtZCb5fP2zhPiS1LG2
         46d3hBD9Up8kQPwKun7gSzXH4aVqVdaSa2wCeI0ltCIBorp/E9+VdzF85/kxl26t3qgy
         JmZaDgCJ8DE2MU4Jhm/v5LYhXDSHGM40wugmAWzHY0XG/c9GxJOvS9ZqP/HCD44r9Ghy
         MByX6zna3kql7Wg8/TbiJ0mLOzkoNbK/f2kaPxKhNUyJ4Hc81JecsXEAVQebDkhF/UQ9
         DatQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768864179; x=1769468979;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y7pTPfUH6iVzqZGYdTEFNi2KI6ZRLfJ8c6TQ1mSDQ68=;
        b=pudIxHC0Qsyrc8ttJZ2bwULd7KNbCuk179aJ3n6rTtAepZsWXGycdQ4By2aMT1/hZt
         Mwf+e5AQjNWXWLYy+3+N79UlEZrQP96v3U0xmh7j4ET3nA9jssQnfiHvjM9smkDlchb9
         J4vmq5WzUtE4KnheDdJEDRyY3rLTiiUm7k2CK5XWRuhm0DJzKam/yePUN67jWYrM2dxc
         lEmzLNg51ph/rocxhTk/JnG3MpMxpHP1yrIBBo7iR0BkHPMNFIcwPXsxowJb39nzqkq3
         qEwpZf4iEBiVoIECVi8cbAUkT2iEjvwabIroHjpuv+YMek1ou7OI8iAZcyRvPvJSsQqY
         kbhg==
X-Forwarded-Encrypted: i=1; AJvYcCX5/jcuitp+O09htO6wr2cdLpICjX2gxeYu6rrgJy9CeJFt0thvQ4m0B/6h/glQbMbe96u1KOu0WwHo@vger.kernel.org
X-Gm-Message-State: AOJu0Yzd5IFl3fPJr/XZYtT3bpCIMTGSCCZoUKoZnm33qIAFfV52hdjw
	x7MMzwdyOOFsyJDBDp62QL6vy9edE+4klZGmc1aGVFOF3xUMPzQRLbScu+FaO5aHktaezVoKPYZ
	MewV2m3vszzlMA7353EZBBdfsd0t5rWOlu5SXTdCkCJorQ+8srGlIgebyPtN+mk64
X-Gm-Gg: AZuq6aIZ/TWePSPV6OZHvNp6abkR/fdPGc/uiunps2bHUC5Dks9zZJ2m6sHJAhHy1xN
	1dwfTAGo6bxqzfHg39r7bXpceWD6rugH7rNNBXOFIZt76WCeY24sJN5mnfE8Lb3tWhuvOugld3Y
	4ukdpcGEZGMdl+GygsvROPVACuZz+KSpoHw29EXS8/ty8d5KDfU5QsbnnyTyp+uo+tMzEL9ddrH
	poMWjJuo87q8ESZ6Faxtr142T9HGE6rNt0RKswPSDPgOzfysstKqRx2toddXQYmZrJOo7XB/Qpp
	09gpzF4lhwbYQMlwvsXR8Nuo9r4Z83PeQwTanOnw+1/5nwkHpougYnq3ASwF8P3mTcjrqZWgoCi
	rPFcMv9RwdHpjwOSu0KuXbF18v9HzPHD4bhW8NNSTefbrCwclhnTlv5ENg+3/Evf/h6G6dZFOlG
	evoi5Ivo3TvhjbAHwkQHh8kUI=
X-Received: by 2002:ad4:596f:0:b0:880:5193:1102 with SMTP id 6a1803df08f44-8942e4ca766mr189035716d6.56.1768864179405;
        Mon, 19 Jan 2026 15:09:39 -0800 (PST)
X-Received: by 2002:ad4:596f:0:b0:880:5193:1102 with SMTP id 6a1803df08f44-8942e4ca766mr189035436d6.56.1768864178937;
        Mon, 19 Jan 2026 15:09:38 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf3a17dcsm3686254e87.89.2026.01.19.15.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 15:09:36 -0800 (PST)
Date: Tue, 20 Jan 2026 01:09:34 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Simona Vetter <simona.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Maxime Ripard <mripard@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
Message-ID: <g6tcsjmc27jafnfwbyltlq7lhbldcdlfbf4qiqwrnp6iyndk3o@lrcnxz5ud27b>
References: <aW5r7NzicgqvpaUj@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aW5r7NzicgqvpaUj@sirena.org.uk>
X-Proofpoint-ORIG-GUID: at0fXLzdMtDx7cWpmZYCmJvz4VfSxNoU
X-Authority-Analysis: v=2.4 cv=N40k1m9B c=1 sm=1 tr=0 ts=696eb9b4 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=grscYz08w_xL7T5cvToA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDE5NCBTYWx0ZWRfX0ZZeOH5CE18E
 Xp31P6zAFKM962krC4aTj7jF7Q2zYZM3Addj+fwTuEtRt9zsJP8zeMm3rkrhGNKGiYVC1RQGYIY
 IfLCwLFRjIwnXWWClBOu2k/czq0Erl8/QpLa9BFnSjjaizKK0DT1EA1j3uxEXbaGStFPEnC802O
 RdITkmXAlCQmfQuyo+OUQeL+CgWPwAizKnvoOrHeqabbdU9wsmy4v9S3Ke359Sbk37sZMXjvvAt
 duc9AB/lmMbMcOIv4YFqs+PSSLea2/GD33YYlByTSj0CJd5t+I8Ih88bj9452Aj6g8IoaQE7Ncy
 sakAfYpglziavkUYd+XGNVkbAZFTr9bIe+AdApG5HdxT7wjDSo/1FYtMDaJmyMG7ZS6rUInzku4
 M68OleGcYJ8PCuDLSNN7JpgH9KC3BNJozK2GL1lBk2elYe1+93wUC0x0sNgGK+N4qG+eis75kEK
 P3YXE6LRVxNjY2iXxfQ==
X-Proofpoint-GUID: at0fXLzdMtDx7cWpmZYCmJvz4VfSxNoU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_06,2026-01-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190194

On Mon, Jan 19, 2026 at 05:37:48PM +0000, Mark Brown wrote:
> Hi all,
> 
> After merging the drm-misc tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> /tmp/next/build/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c: In function 'drm_test_check_reject_hdr_infoframe_bpc_10':
> /tmp/next/build/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c:2926:49: error: passing argument 6 of 'drm_property_replace_blob_from_id' makes integer from pointer without a cast [-Wint-conversion]
>  2926 |                                                 &replaced);
>       |                                                 ^~~~~~~~~
>       |                                                 |
>       |                                                 bool * {aka _Bool *}
> In file included from /tmp/next/build/include/drm/drm_connector.h:33,
>                  from /tmp/next/build/include/drm/drm_modes.h:33,
>                  from /tmp/next/build/include/drm/drm_crtc.h:32,
>                  from /tmp/next/build/include/drm/drm_atomic.h:31,
>                  from /tmp/next/build/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c:7:
> /tmp/next/build/include/drm/drm_property.h:287:47: note: expected 'ssize_t' {aka 'long int'} but argument is of type 'bool *' {aka '_Bool *'}
>   287 |                                       ssize_t max_size,
>       |                                       ~~~~~~~~^~~~~~~~
> /tmp/next/build/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c:2922:15: error: too few arguments to function 'drm_property_replace_blob_from_id'
>  2922 |         ret = drm_property_replace_blob_from_id(drm,
>       |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> /tmp/next/build/include/drm/drm_property.h:282:5: note: declared here
>   282 | int drm_property_replace_blob_from_id(struct drm_device *dev,
>       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Caused by commit
> 
>    7436a87db99d5 (drm/tests: hdmi: check the infoframes behaviour)
> 
> interacting with
> 
>    ca59e33f5a1f6 (drm/atomic: add max_size check to drm_property_replace_blob_from_id())
> 
> I have applied a fixup:

This fixup is correct. I've sent a formal patch,

https://lore.kernel.org/all/20260119-fix-kunit-infoframe-v1-1-5f2f9b066594@oss.qualcomm.com/

> 

-- 
With best wishes
Dmitry

