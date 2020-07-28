Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 911BE23055E
	for <lists+linux-next@lfdr.de>; Tue, 28 Jul 2020 10:28:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728148AbgG1I2e (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 28 Jul 2020 04:28:34 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:18127 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727878AbgG1I2e (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 28 Jul 2020 04:28:34 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1595924913; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=JsZFMI5l/wCWWGprGiEt11W9Nl9giP5BK5ShNxbLSLs=; b=e2evAm/DQ9rDOzKqrn4WEKAMUtYCxkCqgsmFFQ+37HtFNUU7yTGSJwb/vBIicG1zClnOKtPO
 rKZXVy0zmq2+SkUBAjCqMzlT0OeiivnlXQPW7MPDozfcNFHJinZiHeC5YEhatICRRbERRqZs
 G8YmFXVFIo1vUPXEIFAi9Onc4d0=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmNGRkZiIsICJsaW51eC1uZXh0QHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 5f1fe134a61bb9e3f57d16be (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 28 Jul 2020 08:26:28
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 76611C433CB; Tue, 28 Jul 2020 08:26:27 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=2.0 tests=ALL_TRUSTED,NICE_REPLY_A,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.102] (unknown [49.204.127.128])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sivaprak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8D6D3C433C9;
        Tue, 28 Jul 2020 08:26:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8D6D3C433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sivaprak@codeaurora.org
Subject: Re: linux-next: manual merge of the devicetree tree with the pci tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Rob Herring <robherring2@gmail.com>,
        Bjorn Helgaas <bhelgaas@google.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ansuel Smith <ansuelsmth@gmail.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
References: <20200728154903.51a60b8e@canb.auug.org.au>
From:   Sivaprakash Murugesan <sivaprak@codeaurora.org>
Message-ID: <c7c752bc-2a06-fc56-6f87-dfdddd8a436e@codeaurora.org>
Date:   Tue, 28 Jul 2020 13:56:21 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200728154903.51a60b8e@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 7/28/2020 11:19 AM, Stephen Rothwell wrote:
> Hi all,
>
> Today's linux-next merge of the devicetree tree got a conflict in:
>
>    Documentation/devicetree/bindings/pci/qcom,pcie.txt
>
> between commits:
>
>    736ae5c91712 ("dt-bindings: PCI: qcom: Add missing clks")
>    b11b8cc161de ("dt-bindings: PCI: qcom: Add ext reset")
>    d511580ea9c2 ("dt-bindings: PCI: qcom: Add ipq8064 rev 2 variant")
>
> from the pci tree and commit:
>
>    70172d196947 ("dt-bindings: pci: convert QCOM pci bindings to YAML")
>
> from the devicetree tree.
>
> I don;t know how to fixed it up so I just left the latter one . This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Rob/Bjorn,

Please let me know if I can provide a patch rebased to linux-next.

Bjorn can pick up the patch after review and Rob can drop the old pci 
yaml conversion patch.

let me know your thoughts.

>
