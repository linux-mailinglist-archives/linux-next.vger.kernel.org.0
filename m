Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC9293AEB89
	for <lists+linux-next@lfdr.de>; Mon, 21 Jun 2021 16:38:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230021AbhFUOky (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 21 Jun 2021 10:40:54 -0400
Received: from mail-am6eur05on2051.outbound.protection.outlook.com ([40.107.22.51]:50325
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229747AbhFUOkx (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 21 Jun 2021 10:40:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dBtJ8IJF2amFVperPDjAsvHopiILQr4p9spoK3+hbN7mMUEeEkeeIQ7+MzczCzuTm+dlSJx8+8ZCH5ZtXOGHU3GmR4d8Sw0hVBUWeitsvlKhmmmPXx1IfCivbITqUilFNGqfNliow2ytMzJze6c1VqNfm7V9cvZ6CYh+DlBjkwB+q83fODvH/wxswiG59lVo2/cH8tFg3zpW6F/G7AX2/dMjChlnq0wWb9nBnwATn7szuFiOb4PuCdSCsoJRN/oDYod7XhBoQNvK3eG3tvW/0G86k+zWuRMaHr4HNecSnIQpTlZAKVX1RsFQ9akL3aqwCnGDFA6n2roAuxh1DgCI9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UaM6tK1xhWS9VP/EItAOvtQ/OXj37UFwpfzSQzWppKQ=;
 b=V6wH73Jnwn+zEzHf9gH7pJ7YlfmwgLbmLHgZKi/ZB5wjejMsxPlYwSJrkrlScuB9Xk+qWsLSYax54ime593GPA/vl/ZI3cOvafjyidjwYKhLR4rWo7SoJvkYmx+942pqVfM13X2guonWJb4I0cNIfyPMGGWxp6rN8AvPIoSwm09xsyg1+/N9/VQoh9rlItT4j69WVlGLIWqR468Od308YpA9cISK/YSahM9gwLXxqVcb0ddHa6if162hqluy7xELmTjeplRnxZnHKvWokyrw1LVMyC//I10mqfgGadImbqkEzpyBLrLqCynyRzz0NCCT3uVNmYE8HaheTBqjhY1TVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=secospa.onmicrosoft.com; s=selector2-secospa-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UaM6tK1xhWS9VP/EItAOvtQ/OXj37UFwpfzSQzWppKQ=;
 b=s4i5IoccGa0zvtGQEYC9+YBUYC4ZBrwxoFeAuGvFVKgOujLK1djedtCG3f3mfXjcmuKvJPq+pStan8NZp2fe3Blt7gUiAi3AuAHMMyXCy9c0w6+AECDHESiIWlsQUrJ+BStdNO6/RVJe0ey7u1ysid053gc2qCJoL4b+LDPaCgU=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4523.eurprd03.prod.outlook.com (2603:10a6:10:19::27)
 by DBBPR03MB7146.eurprd03.prod.outlook.com (2603:10a6:10:209::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.18; Mon, 21 Jun
 2021 14:38:36 +0000
Received: from DB7PR03MB4523.eurprd03.prod.outlook.com
 ([fe80::40d5:3554:c709:6b1b]) by DB7PR03MB4523.eurprd03.prod.outlook.com
 ([fe80::40d5:3554:c709:6b1b%5]) with mapi id 15.20.4242.023; Mon, 21 Jun 2021
 14:38:36 +0000
Subject: Re: linux-next: Fixes tag needs some work in the devicetree tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Rob Herring <robherring2@gmail.com>
Cc:     Luca Ceresoli <luca@lucaceresoli.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20210621084216.3c477f94@canb.auug.org.au>
From:   Sean Anderson <sean.anderson@seco.com>
Message-ID: <456f4183-aa2e-b714-e681-819485f222a1@seco.com>
Date:   Mon, 21 Jun 2021 10:38:32 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210621084216.3c477f94@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [50.195.82.171]
X-ClientProxiedBy: BL1PR13CA0120.namprd13.prod.outlook.com
 (2603:10b6:208:2b9::35) To DB7PR03MB4523.eurprd03.prod.outlook.com
 (2603:10a6:10:19::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.27.1.65] (50.195.82.171) by BL1PR13CA0120.namprd13.prod.outlook.com (2603:10b6:208:2b9::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.9 via Frontend Transport; Mon, 21 Jun 2021 14:38:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e3b61e08-bf12-43eb-77b6-08d934c240bd
X-MS-TrafficTypeDiagnostic: DBBPR03MB7146:
X-Microsoft-Antispam-PRVS: <DBBPR03MB71467E3B2E8B71057610DEA9960A9@DBBPR03MB7146.eurprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:177;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NdI3F5uctKypH613oYX4aet9FzRnH3u5nZvYlmbDMPsrkOG/khp8y3nPCowYrHg0TZ86DUg2BhMiJE7bsKGfmyRtmDxLyip3VwAZxR4I7UK/xspnH/I3jyBeVIHtjuz2SVdt/HUurq2NZQehH/dupv+UeUspOg7Kg5AILZ1uoj7eI9SmIvKN4pjzy4EUuyCgInG8PAxsfqfAKOZlicWM4RLWiiABQ/VvVQ3R1nl4x/1K8oYQYxt4Shg3WxZ/8PPaARfgYc4XG8ZJrZvZhedoVjQUF+1xQTZnKf6cHY5mwj1OSButjO/d2YANWkfFv8UcUeMigq314fksIh7cP1VCG4bfjCrhObo/dUTJDl4KfzBoz1X1ToNTA+3H3TAKZbvVzXZzwhOoCjG4GOqkQviJUD+w/xw7jp3h2+eDd1KwlkUe2c/xUXk6fXIel4wgZWFxEiL/USNdpVtujphgDYVgBdbNwFw2T61q7uojC540XRkZ8TQNsG+bopHaRk9ua4NIz2GUTUw8N9+M/FouIUg3+BJUSMLcEH2je+iB1P+1ZEZi45hCrcoDL7BB0lWNYRcnqP6CLrTOQzwREm7OgoUoY+xO4Ygf36+5+d3xkIzbKbzaNs9HXaZ/nCrz5iBeLKtcwTQhroPUp+kmrYe0raBrT6fRhmRDX4GhYUo4gsqmlrubZG/Ug+x0J/ngQJt/LmNMAqWA4IMGZ545x0PtJzy3Fw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4523.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(346002)(39850400004)(136003)(376002)(366004)(54906003)(4326008)(44832011)(956004)(2616005)(31696002)(26005)(31686004)(110136005)(8676002)(478600001)(6486002)(38350700002)(66556008)(53546011)(16576012)(52116002)(36756003)(6666004)(2906002)(66946007)(86362001)(83380400001)(186003)(316002)(5660300002)(66476007)(16526019)(38100700002)(8936002)(4744005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?Windows-1252?Q?9UwFV7TGiJDcZUWPp3EkojbUIphcutlx0P23Uob98oXkXiLTV8YwxX4A?=
 =?Windows-1252?Q?uJ7EJbJYifM8Sk+LHOw6K8HjfN7FLJtnishR6ey7jyEXvQghK/HJ0OBP?=
 =?Windows-1252?Q?AETFY13b/TdqweLBAjusBPgKkPBfAD6Wywuc40ugJ1x12705CjJPf010?=
 =?Windows-1252?Q?wn8lBpX5Vw9ehm8tZcBztc214LcrGqlRfJ/IcCXbw7NdijFhY0GG/gce?=
 =?Windows-1252?Q?8PhmrJiBqZWRDydZG0b44UsqvD7ry39WQmU9x1yTgvj+DySzQZbJZ0HS?=
 =?Windows-1252?Q?8fTjkbi4CA8wtuA/lT0h/tFqxuD9wKuOPi15u8v4d5FJa72Y/DozGCPp?=
 =?Windows-1252?Q?JqFdUMJAZXB25UyDCFVFvpsWkijx1H6gDFsurGRZIz5665Vbo0DA9/FE?=
 =?Windows-1252?Q?alpCjQZg4Qq8M6LALLOFECpPT1Ai791YO/CYVciq0r98l8gvS4iLD9Ji?=
 =?Windows-1252?Q?neY1J1PoMWQ/jBG6TrdYMySdJBjsjIMaC7jkF55BH6EW8pEZJd2w+ECA?=
 =?Windows-1252?Q?IdQMflICl7UXLCpvvq4wYSqnCvJVQbMVMdqej+WVheWxKYnjCCzhZo6h?=
 =?Windows-1252?Q?/8QmeDwBOwM7IWNZIJv5siF6pPOG+osTVjbCSklFLIOBGYspasRxUTzm?=
 =?Windows-1252?Q?AxQ6rqrKlFzoLYejtrlRPR9U/lhUuzt+XnX8mSrQdBUKWQcL0NNMhZw2?=
 =?Windows-1252?Q?4Nwx5ScCZA2895GqVOatTHHcP0emlL4L9CWBOm6o7WhesCcI9MU73lRR?=
 =?Windows-1252?Q?4282lCIO/ilpQLdiSItzZ05Sr/f5Dtx7k984OBowzCxv1nuLqjhwVFsh?=
 =?Windows-1252?Q?BGq/Dd3mN6f8mrSzmp6ZK0kU+Yles38nF85+x++Z/X1wQGWuakHZmOhT?=
 =?Windows-1252?Q?sOgj0JLtePIpjROYxKyzSfkL/qTW4P352gawauMeKLbgCq8CsyvWaCyB?=
 =?Windows-1252?Q?xJJx/b3ftlIYbZhXruXVdSm6QbxtPlKPoF5vEeVS5oDBs2/7cEzMHNki?=
 =?Windows-1252?Q?An2hmDp9bjyFSXSMaOJiv3TH6+h4PpinEzI27j2LhphD7hErl/sK4w7M?=
 =?Windows-1252?Q?IVFVQ4ri1tba5NAuw7EBb/wpzFH7VYTgjBkZkqbNOtmspWaFqvLCJvOy?=
 =?Windows-1252?Q?he++yBw1UE2q6oqtQSSg0DqIH4lYbJXDOWB0q1cf9YR94JR+mmW/UOnU?=
 =?Windows-1252?Q?zfATn4vBdHjskfrBIzEZN9pR73ixb9UShzR4zc9/XG476XHPlvB2MmGY?=
 =?Windows-1252?Q?9eQfC1w1MwxxvYbEVdZ1Dk5Tr27kTScRz0SFcjTjv7aMzEU4TOjcB+F9?=
 =?Windows-1252?Q?vOdDnWqtDkWzYNe3tWZSk99yaqghI34S8rEkBXAZXrkI7kC09tJ35GTA?=
 =?Windows-1252?Q?EUBm67TOLkBTcjQYw7lqf9k2xo9GsWVChJAhyddYsHzUSlH2RQsoVtnc?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3b61e08-bf12-43eb-77b6-08d934c240bd
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4523.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2021 14:38:36.5553
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nI8katbVvxqdZKCmrKiBo7oTmZ7h298MHxipZ8pmOtn+iHBG/1orsTIn0FG82/gp/mu7Rdry9WduUsfnES0WKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB7146
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



On 6/20/21 6:42 PM, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>    f92f2726e3dd ("dt-bindings: clk: vc5: Fix example")
> 
> Fixes tag
> 
>    Fixes: 766e1b8608bf ("dt-bindings: clk: versaclock5: convert to yaml")
> 
> has these problem(s):
> 
>    - Target SHA1 does not exist
> 
> Maybe you meant
> 
> Fixes: 45c940184b50 ("dt-bindings: clk: versaclock5: convert to yaml")
> 

Ah, yes I do. Should I submit a v2?

--Sean
