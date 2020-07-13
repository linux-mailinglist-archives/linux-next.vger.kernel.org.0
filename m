Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69FE621D066
	for <lists+linux-next@lfdr.de>; Mon, 13 Jul 2020 09:29:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729049AbgGMH3T (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 13 Jul 2020 03:29:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725818AbgGMH3R (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 13 Jul 2020 03:29:17 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00F1CC061794
        for <linux-next@vger.kernel.org>; Mon, 13 Jul 2020 00:29:16 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id j4so14558304wrp.10
        for <linux-next@vger.kernel.org>; Mon, 13 Jul 2020 00:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cumulusnetworks.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=4kU8N5DeedpzZY27vYaHJmaCubANM+yECKFDBgJweY4=;
        b=D7xh6eu++gbVif5cEAGGKdiDsW9xxIY4MmHaAwDepJv1tFzVb7Zi9vbwXIkAq6OSMC
         ao2hKH3BT4xs6mO1GFJTVEZ+p1It4SRAP0g9VFFPbOgQBlsZOy0TX3yRmAuQxnyUrrNK
         mtOZKb8/Zj1Qnf2li7fwOFjgLdjMbc1nTKtBc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4kU8N5DeedpzZY27vYaHJmaCubANM+yECKFDBgJweY4=;
        b=drZMnu7uBmf0zK1zCl88huA9lD6+m0C/SCyRxVFUQuWZQoxegTx9LgaOue4AP3rRg5
         MEdJIHb9smum71AooipE8EskV8gj6DBKFVWy5lFNn1kZJqKJryec/yUN2rYjfMHQ5fhe
         yO6dNJlNlxhxIJftLkmhTxgZkKBxKeeH3KBp6tmz650GP/ah2v93epz3VVWVIeyQA2EA
         EO8KJ2ZUdn5nlV9ciBQgwm0SwM334anMjpTdiy7qwpKz3ah3kCHntbQMbvrFaQRnEKiQ
         xXvLVOBhrMwLsx9WsBEThtvin9VpNvb5N9O2kLwXTDbr03QKxIxA/Kje9c7gAEmZOM9O
         ES5w==
X-Gm-Message-State: AOAM53112zQz9OZfw6upOVhsc/ZcePhQxjHg2CYQN6jB41E95JwI7Q0O
        y9vrbfVBOENuWdbe9KMEvDSJdBXzbzMGIw==
X-Google-Smtp-Source: ABdhPJyhZaYuvI1VIdHE2m9jwzvJxy3uMEncr3I2/2Fzsq4u4hxVDd97IeUGkvgBxSbMFMvVXofGqA==
X-Received: by 2002:a5d:43d0:: with SMTP id v16mr82553551wrr.296.1594625355477;
        Mon, 13 Jul 2020 00:29:15 -0700 (PDT)
Received: from [192.168.0.109] (84-238-136-197.ip.btc-net.bg. [84.238.136.197])
        by smtp.gmail.com with ESMTPSA id d13sm21582030wrq.89.2020.07.13.00.29.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2020 00:29:14 -0700 (PDT)
Subject: Re: linux-next: build failure after merge of the net-next tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        David Miller <davem@davemloft.net>,
        Networking <netdev@vger.kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20200713115412.28aac287@canb.auug.org.au>
From:   Nikolay Aleksandrov <nikolay@cumulusnetworks.com>
Message-ID: <e1d2b00a-52d4-e36e-317f-314ac3aecca6@cumulusnetworks.com>
Date:   Mon, 13 Jul 2020 10:29:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200713115412.28aac287@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 13/07/2020 04:54, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the net-next tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> net/bridge/br_netlink_tunnel.c: In function '__vlan_tunnel_handle_range':
> net/bridge/br_netlink_tunnel.c:271:26: error: implicit declaration of function 'br_vlan_can_enter_range'; did you mean 'br_vlan_valid_range'? [-Werror=implicit-function-declaration]
>   271 |  if (v && curr_change && br_vlan_can_enter_range(v, *v_end)) {
>       |                          ^~~~~~~~~~~~~~~~~~~~~~~
>       |                          br_vlan_valid_range
> 
> Caused by commit
> 
>   94339443686b ("net: bridge: notify on vlan tunnel changes done via the old api")
> 
> CONFIG_BRIDGE_VLAN_FILTERING is not set for this build.
> 
> I have reverted that commit for today.
> 

Oops, sorry that's my bad. I mixed br_netlink_tunnel with br_vlan_tunnel, the latter is compiled only
when bridge vlan filtering is defined.

Anyway, I'll post a fix ASAP.

Thanks.
