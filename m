Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95B911707D8
	for <lists+linux-next@lfdr.de>; Wed, 26 Feb 2020 19:41:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726878AbgBZSl4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 26 Feb 2020 13:41:56 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:53529 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727068AbgBZSl4 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 26 Feb 2020 13:41:56 -0500
Received: by mail-wm1-f67.google.com with SMTP id f15so377873wml.3
        for <linux-next@vger.kernel.org>; Wed, 26 Feb 2020 10:41:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wgiZ1ng+EHQCRGEhYXEQoZQ67xno4JfWUO2p/Jhkjg0=;
        b=qJS4VPgrThR0XLxKkeNdaSuZ9NQVodulCX6cNeQaLAEd3PVxkfBS/VKBNJB0Q2gmfC
         G/bClwihJUrKE4XaS9p2EFGFE38KEh52iuaZiQtCxNNtUM8yPeoI2U2GhWEcbbvOdEMI
         pRd0RSQAAYmX1SGAGtHrww0TPRz1ejY/ahznHaOZhG+VqApPCJYVoPhbUSfcgtKJTlmJ
         DC5yDCe5AoBNGV6+aJEUg4joA7uHL6Qojz0whXqeTzXYs39MInlnv6AMRRMNFpJrUnfB
         4/ZekkG1ttzVCY5uE7y8QyC1ip7E61yOkwAa/1VnAogL3gAGsZkRzbOfvqW2MJlArkbC
         AV8A==
X-Gm-Message-State: APjAAAXeOEXUz4niZO+E+Uw7XDNaRPwA4byJnZo3Wj4vukWWS7ChBNYZ
        sbioZJBocr4rUROOrGE9mGU=
X-Google-Smtp-Source: APXvYqwuw36jus9Ar7ixop4LA8bXmICEPCDIDDxHUl3/gyhnkSyoVJV/RDfl7iA236b+UdMJ2aBtuw==
X-Received: by 2002:a1c:dd87:: with SMTP id u129mr217096wmg.111.1582742514271;
        Wed, 26 Feb 2020 10:41:54 -0800 (PST)
Received: from localhost (ip-37-188-190-100.eurotel.cz. [37.188.190.100])
        by smtp.gmail.com with ESMTPSA id j11sm4003459wmi.3.2020.02.26.10.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2020 10:41:53 -0800 (PST)
Date:   Wed, 26 Feb 2020 19:41:52 +0100
From:   Michal Hocko <mhocko@kernel.org>
To:     Christopher Lameter <cl@linux.com>
Cc:     Sachin Sant <sachinp@linux.vnet.ibm.com>,
        Pekka Enberg <penberg@kernel.org>,
        David Rientjes <rientjes@google.com>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Kirill Tkhai <ktkhai@virtuozzo.com>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        linuxppc-dev@lists.ozlabs.org
Subject: Re: [5.6.0-rc2-next-20200218/powerpc] Boot failure on POWER9
Message-ID: <20200226184152.GQ3771@dhcp22.suse.cz>
References: <0ba2a3c6-6593-2cee-1cef-983cd75f920f@virtuozzo.com>
 <F5A68B0C-AFDE-4C45-B0F3-12A5154204E6@linux.vnet.ibm.com>
 <20200218115525.GD4151@dhcp22.suse.cz>
 <D6F45EDD-9F2E-4593-B630-55E5BD7DE915@linux.vnet.ibm.com>
 <20200218142620.GF4151@dhcp22.suse.cz>
 <35EE65CF-40E3-4870-AEBC-D326977176DA@linux.vnet.ibm.com>
 <20200218152441.GH4151@dhcp22.suse.cz>
 <alpine.DEB.2.21.2002220337030.2000@www.lameter.com>
 <20200224085812.GB22443@dhcp22.suse.cz>
 <alpine.DEB.2.21.2002261823270.8012@www.lameter.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2002261823270.8012@www.lameter.com>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed 26-02-20 18:25:28, Cristopher Lameter wrote:
> On Mon, 24 Feb 2020, Michal Hocko wrote:
> 
> > Hmm, nasty. Is there any reason why kmalloc_node behaves differently
> > from the page allocator?
> 
> The page allocator will do the same thing if you pass GFP_THISNODE and
> insist on allocating memory from a node that does not exist.

I do not think that the page allocator would blow up even with
GFP_THISNODE. The allocation would just fail on memory less node.

Besides that kmalloc_node shouldn't really have an implicit GFP_THISNODE
semantic right? At least I do not see anything like that documented
anywhere.

-- 
Michal Hocko
SUSE Labs
