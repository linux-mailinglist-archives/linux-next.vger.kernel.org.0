Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3180170838
	for <lists+linux-next@lfdr.de>; Wed, 26 Feb 2020 20:02:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727137AbgBZTCN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 26 Feb 2020 14:02:13 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:37643 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727146AbgBZTCN (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 26 Feb 2020 14:02:13 -0500
Received: by mail-wm1-f67.google.com with SMTP id a141so453119wme.2
        for <linux-next@vger.kernel.org>; Wed, 26 Feb 2020 11:02:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wma8//MuEJ5lDMCNv7woFeX6q3iIbYqlguJq6Z39y9g=;
        b=Oajr6u/nAc7/f0TLXLZ6Tuu5ZHl/Whb5opx1e6hFNH66QQHD5mECKuP+1A9zwiL2VG
         TgwgvJx2k+3WnQxbm3yKIEKBtysA6MuhknlPUoLcS0psbiJ5hreYiwfxLrhB92OxG2Ag
         tw+1EBDMeUQ28de3gJ0Mw8AIkCB/Ymq9zjqjz38BpLUqJbJynvrpTgPhT8QwcF7EKWsW
         6HDjFng+/LiaWnswRsVBF9ZakRaDz0j2wJlMPHpHFdfNeQQN3DwejpcwgU0GbquNUjEM
         K5LFeeSSSQ+tAnBAsUZYfEG+HIrvJhmgZPJ9oUcF1rM0WT0uuUIaUXl/3lFL7HIXAbc2
         xmHA==
X-Gm-Message-State: APjAAAVE98Y1RqqZJdJkDMjN7dlPPduiOdVvOafFD8A2YbHSou8pZrdc
        AsnHF3T6d7kxUuf847Fc0J5GILj0
X-Google-Smtp-Source: APXvYqy1WHHW7PhNyQZfNF9Uby7MTmMW2VacmOxQznSOX8L9F7K9RTZt3mm2UBxnU4ncOA9Q4kOakw==
X-Received: by 2002:a1c:a706:: with SMTP id q6mr288531wme.23.1582743731757;
        Wed, 26 Feb 2020 11:02:11 -0800 (PST)
Received: from localhost (ip-37-188-190-100.eurotel.cz. [37.188.190.100])
        by smtp.gmail.com with ESMTPSA id t133sm4060446wmf.31.2020.02.26.11.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2020 11:01:56 -0800 (PST)
Date:   Wed, 26 Feb 2020 20:01:47 +0100
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
Message-ID: <20200226190147.GR3771@dhcp22.suse.cz>
References: <20200218115525.GD4151@dhcp22.suse.cz>
 <D6F45EDD-9F2E-4593-B630-55E5BD7DE915@linux.vnet.ibm.com>
 <20200218142620.GF4151@dhcp22.suse.cz>
 <35EE65CF-40E3-4870-AEBC-D326977176DA@linux.vnet.ibm.com>
 <20200218152441.GH4151@dhcp22.suse.cz>
 <alpine.DEB.2.21.2002220337030.2000@www.lameter.com>
 <20200224085812.GB22443@dhcp22.suse.cz>
 <alpine.DEB.2.21.2002261823270.8012@www.lameter.com>
 <20200226184152.GQ3771@dhcp22.suse.cz>
 <alpine.DEB.2.21.2002261843200.8915@www.lameter.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2002261843200.8915@www.lameter.com>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed 26-02-20 18:44:13, Cristopher Lameter wrote:
> On Wed, 26 Feb 2020, Michal Hocko wrote:
> 
> > Besides that kmalloc_node shouldn't really have an implicit GFP_THISNODE
> > semantic right? At least I do not see anything like that documented
> > anywhere.
> 
> Kmalloc_node does not support memory policies etc. Only kmalloc does.
> kmalloc_node is mostly used by subsystems that have determined the active
> nodes and want a targeted allocation on those nodes.
 
I am sorry but I have hard time to follow your responses here. They open
more questions than they answer for me. The primary point here is that
kmalloc_node on a memory less node blows up and panics the kernel. I
strongly believe this is a bug. We cannot really make all callers of
kmalloc_node and co. to be hotplug aware.

Another question is the semantic of kmalloc_node when the node cannot
satisfy the request. I have always thought that the allocation would
simply fall back to any other node unless __GFP_THISNODE is explicitly
specified.

-- 
Michal Hocko
SUSE Labs
