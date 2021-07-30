Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 470A73DBA2B
	for <lists+linux-next@lfdr.de>; Fri, 30 Jul 2021 16:15:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231220AbhG3OPg (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 30 Jul 2021 10:15:36 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:54519 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230260AbhG3OPf (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Fri, 30 Jul 2021 10:15:35 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id C09BE5C00DD;
        Fri, 30 Jul 2021 10:15:30 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Fri, 30 Jul 2021 10:15:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=lPddGKCrifVr+BA75hbWtv4wZ0j
        MHiiFPSBlVdDOxQI=; b=f0ceLJqSgju24tQq+439fi8Lc57Jyt8Ugzj1pOPtyyH
        Hlgk9bjPRRl+l6BoZgcjZ/Zsz1xtzmTUhWh31Ofqfy1+LbxblLE4+T/lbLMEGte1
        JTzDbmblM8GLNZitW4+8Yny87X1klt5ysRUyteUDgd6rc06YKLoi2OUh/zIpPy12
        HuOFEfpp8DbFz1SH2L5FOa3/Mef73GchIdf6clz091bHoaf705RZgyYr55JOh8Dt
        M5B1C7z5y6Qhqr4iEBN0hB6FgUx32zExjfFAKIllSxRGhjijmsjS9EpB1ESXBwhH
        c8OPIvg9S/7FehzbT6dZfuBTiMFZVp+z1l4nmzvWqmw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=lPddGK
        CrifVr+BA75hbWtv4wZ0jMHiiFPSBlVdDOxQI=; b=B3ERpgVzdB0YexDE1KJ4gy
        SxblG6l2DetB3OZDyUXSz+pqjV7bnG8ihuZ0xjfsITjPBinl/gqkpylGqs+VFOGK
        Ui6vu3Y0uMvEJSUv6nWqCnmKXiye99B/cDSXpyLginuu4r4pSEd2n6EdRqJPDKRB
        qQCUJZl57F9ANuJWe6M/kqRn9NbLyCQ9OYJtR5wZ4M90IDJLQXHogLfxxx8G9AYw
        mkVQtTn2LgTiswIfsXBNsUuNoFwdOHUvyPPjOAqpKF7rpiiOo2DFWdu/QT2ypg2J
        KYZooRjqT5w9wp5/PX9izYv3toa2vMukcXLNtFnrrFHPtXtIohWtBTt/kJDfgYcg
        ==
X-ME-Sender: <xms:ggkEYXN8aQqbw3YF32CgWkrfQ_ybwXK3daIt_v39fnKnhnZ2OrJ9iw>
    <xme:ggkEYR9rs_Cyo0DwTTV6-5wkV83DBpFpneH9BHFSxKRgIF6mdFx2fXj_W4e-YVs0d
    WeCA--lxlmjgA>
X-ME-Received: <xmr:ggkEYWTOlkhwfCDjZ1fJUISPY1ni2etul-DT1MVnMUYI5EJ9L2Ocexh55zDBPvkAbSD93qQUJNJQiGm1Cwu-RvRcBdeTWB6f>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrheehgdejtdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghgucfm
    jfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepveeuheejgf
    ffgfeivddukedvkedtleelleeghfeljeeiueeggeevueduudekvdetnecuvehluhhsthgv
    rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghhrd
    gtohhm
X-ME-Proxy: <xmx:ggkEYbskt6bEeOZVdpT8FCFtwIeQ7gvc4n2DvFKsN_QkdEyqd9TWjw>
    <xmx:ggkEYfdposmUbtNUfaDCQdNtLuHbeuUNVKTnUTdpgSjF6TcrGlCcZw>
    <xmx:ggkEYX2k9Sfix0Y3xxBQokK8-5qX-1jvZzkQFsIQlIyld7xXzBBngA>
    <xmx:ggkEYXTkSqc_KHmdZ4sVvQqhX0nocpNaoBf2yeO427m34_V-RQKPPw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 30 Jul 2021 10:15:30 -0400 (EDT)
Date:   Fri, 30 Jul 2021 16:15:27 +0200
From:   Greg KH <greg@kroah.com>
To:     Mark Brown <broonie@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Phillip Potter <phil@philpotter.co.uk>
Subject: Re: build failure after merge of the staging tree
Message-ID: <YQQJf7Lrj7p6RvU/@kroah.com>
References: <20210730135340.17863-1-broonie@kernel.org>
 <YQQGgReGba/Ld40y@kroah.com>
 <20210730140454.GZ4670@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210730140454.GZ4670@sirena.org.uk>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Jul 30, 2021 at 03:04:54PM +0100, Mark Brown wrote:
> On Fri, Jul 30, 2021 at 04:02:41PM +0200, Greg KH wrote:
> 
> > Ah, are you building with O= ?  That might be the problem here, I think
> > I had to fix up that mess with the older driver in the past...
> 
> Yes, all the -next integration builds use O= to keep the working trees
> between builds.

Yup, just tested this locally, that's the issue.  Let me make a patch
series to fix this, thanks for the report...

greg k-h
