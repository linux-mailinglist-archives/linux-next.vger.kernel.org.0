Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91361262901
	for <lists+linux-next@lfdr.de>; Wed,  9 Sep 2020 09:38:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727087AbgIIHiG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 9 Sep 2020 03:38:06 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:10239 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729161AbgIIHh3 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 9 Sep 2020 03:37:29 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f5885b20000>; Wed, 09 Sep 2020 00:35:14 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 09 Sep 2020 00:37:29 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 09 Sep 2020 00:37:29 -0700
Received: from [10.26.73.157] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 9 Sep
 2020 07:37:20 +0000
Subject: Re: [PATCH v21 4/4] arm64: dts: mt8183: add scp node
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Eddie Huang <eddie.huang@mediatek.com>
CC:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Pi-Hsun Shih <pihsun@chromium.org>,
        Erin Lo <erin.lo@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Anders Roxell <anders.roxell@linaro.org>,
        <lkft-triage@lists.linaro.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        linux-tegra <linux-tegra@vger.kernel.org>
References: <20191112110330.179649-1-pihsun@chromium.org>
 <20191112110330.179649-5-pihsun@chromium.org>
 <2abf8fdd-7b7c-73b0-beea-9c9ac56869dc@gmail.com>
 <CA+G9fYt9AujG6gyfeV5AaAv0EgggUfGT1jow8DJjVfetVWV3EA@mail.gmail.com>
 <CAJKOXPeV9zCg4v0kBfToGdJSxswbKtT16LVYADALpYRHqWXBOg@mail.gmail.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <ab35a9c7-1b33-dc75-8520-ee072ff1309f@nvidia.com>
Date:   Wed, 9 Sep 2020 08:37:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAJKOXPeV9zCg4v0kBfToGdJSxswbKtT16LVYADALpYRHqWXBOg@mail.gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1599636914; bh=NRptkkFmJKN48wrOiQ7yrq/L1r5kklHTYRCDYEWsDB0=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=jnn3trhAfxkws/mo/0eN55qV+nx5mQCk/pzThZ7D2nd/qaWddSQWnqyb6QeJGMpgd
         q+ta3oSTu4mKCzOXtKbCT+ePy2xLNuB+QIegT9kfNP7SdOmszsOeiPMITVh8PvImwM
         uaI9owjP8fyXn3hIFiGWlL+Sl9jFS3VJaa8dgz+P/It2afJV5nEPu5t1YSi4Snj2mD
         3wzmX4o6aTDAH9n1gPe+1Hof32T3WbGJSykqx+hgO0G4T5b+JXcXDBdjQzOjCjtxto
         WrlnKWqoNxTwhOHsw6zOQByisStAh2vTJIG64NDH/SdxmrvVoYVkZZLYT2r9J/oxoc
         B22SYp58s553g==
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


On 02/09/2020 17:23, Krzysztof Kozlowski wrote:
> On Wed, 2 Sep 2020 at 16:45, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>>
>> On Thu, 27 Aug 2020 at 15:44, Matthias Brugger <matthias.bgg@gmail.com> wrote:
>>>
>>>
>>>
>>> On 12/11/2019 12:03, Pi-Hsun Shih wrote:
>>>> From: Eddie Huang <eddie.huang@mediatek.com>
>>>>
>>>> Add scp node to mt8183 and mt8183-evb
>>>>
>>>> Signed-off-by: Erin Lo <erin.lo@mediatek.com>
>>>> Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>
>>>> Signed-off-by: Eddie Huang <eddie.huang@mediatek.com>
>>>
>>> Sorry I somehow oversaw this. Next time please don't doubt to ping me.
>>>
>>> Bjorn, do I understand correctly that you don't send emails to the list
>>> informing of the inclusion of a patch/series in your tree?
>>>
>>> Anyway applied now to v5.9-next/dts64 :)
>>
>> arm64 build dtbs failed on linux next 20200902.
> 
> I just hit it as well... I wish the kernel was built after applying
> patches... it would make the next a better place.


Any update on this? It is still broken as of next-20200908.

Jon

-- 
nvpublic
